import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/Views/CallView/widgets/call_avatar.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Views/VideoView/video_view_logic.dart';
import 'package:chatface/Views/VideoView/widgets/rive_scene_cache.dart';
import 'package:chatface/Views/VideoView/widgets/video_active_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_character_swipe_deck.dart';
import 'package:chatface/Views/VideoView/widgets/video_ended_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_filter_bar.dart';
import 'package:chatface/Views/VideoView/widgets/video_idle_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_page_header.dart';
import 'package:chatface/Views/VideoView/widgets/video_sidebar.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class VideoView extends HookConsumerWidget {
  const VideoView({super.key, this.initialCharacter});

  final PersonaProfile? initialCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final container = ProviderScope.containerOf(context, listen: false);
    final personasAsync = ref.watch(personaListProvider);
    final filteredPersonasAsync = ref.watch(filteredPersonaListProvider);
    final ttsState = ref.watch(ttsPlaybackProvider);
    final callSession = ref.watch(callSessionControllerProvider);
    final callSessionNotifier = ref.read(
      callSessionControllerProvider.notifier,
    );
    final user = ref.watch(userProfileProvider);
    final sttResumeTimer = useRef<Timer?>(null);
    final lastAutoLaunchedInitialCharacterId = useState<String?>(null);
    final offerings = useState<Offerings?>(null);
    final isFetchingOfferings = useState<bool>(false);

    String normalizeConversationLanguage(String? value) {
      final normalized = value?.trim().toLowerCase();
      if (normalized == null || normalized.isEmpty) {
        return 'en';
      }

      return switch (normalized) {
        'ch' || 'cn' => 'zh',
        'jp' => 'ja',
        'kr' => 'ko',
        'br' => 'pt',
        _ => normalized,
      };
    }

    useEffect(() {
      final subscription = container.listen<SttState>(sttControllerProvider, (
        prev,
        next,
      ) {
        if (!context.mounted) return;
        if (prev?.streamStatus != StreamingSttStatus.error &&
            next.streamStatus == StreamingSttStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.videoChat.networkHiccup)),
          );
        }
      });
      return () {
        sttResumeTimer.value?.cancel();
        subscription.close();
      };
    }, const []);
    final isInitialPersonasLoading =
        personasAsync.isLoading && !personasAsync.hasValue;
    final isInitialFilteredLoading =
        filteredPersonasAsync.isLoading && !filteredPersonasAsync.hasValue;
    if (isInitialPersonasLoading || isInitialFilteredLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final hasBlockingPersonasError =
        personasAsync.hasError && !personasAsync.hasValue;
    final hasBlockingFilteredError =
        filteredPersonasAsync.hasError && !filteredPersonasAsync.hasValue;
    if (hasBlockingPersonasError || hasBlockingFilteredError) {
      return Center(
        child: Text(
          "${context.t.videoView.errorLoad}${personasAsync.error ?? filteredPersonasAsync.error}",
          style: AppTextStyles.body(14, color: Colors.white70),
        ),
      );
    }

    // State
    final callState = useState(CallState.idle);
    final currentCharacter = useState<PersonaProfile?>(null);
    final isCameraEnabled = useState(true);
    final activeCameraPosition = useState(SensorPosition.front);
    final cameraAwesomeFilters = useMemoized(
      () => List<AwesomeFilter>.unmodifiable(awesomePresetFiltersList),
      const [],
    );
    final selectedCameraFilter = useState<AwesomeFilter>(
      cameraAwesomeFilters.first,
    );
    final cameraRuntimeState = useRef<CameraState?>(null);
    final lastAppliedCameraFilterId = useRef<String?>(null);
    final filters = ref.watch(personaFilterProvider);
    final isFollowLoading = useState(false);
    final isCharacterSwitching = useState(false);
    final swipeDragOffset = useState(0.0);
    final swipeProgress = useState(0.0);
    final swipeDirection = useState<VideoSwipeDirection?>(null);
    final swipePreviousCharacter = useState<PersonaProfile?>(null);
    final swipeNextCharacter = useState<PersonaProfile?>(null);
    final isSwipeAnimating = useState(false);
    final showFullscreenConnectingOverlay = useState(false);
    final characters =
        filteredPersonasAsync.value?.map((persona) {
          final resolvedLanguage = normalizeConversationLanguage(
            filters.language ??
                persona.selectedLanguage ??
                persona.defaultLanguage,
          );
          return persona.copyWith(selectedLanguage: resolvedLanguage);
        }).toList() ??
        const [];

    PersonaProfile? resolveCharacterById(String personaId) {
      for (final character in characters) {
        if (character.id == personaId) {
          return character;
        }
      }

      final allPersonas = personasAsync.value ?? const <PersonaProfile>[];
      for (final persona in allPersonas) {
        if (persona.id == personaId) {
          return persona;
        }
      }

      if (initialCharacter?.id == personaId) {
        return initialCharacter;
      }

      return null;
    }

    PersonaProfile? resolveCharacterForCall(CallSession session) {
      final persona = resolveCharacterById(session.characterId);
      if (persona == null) {
        return null;
      }

      final selectedLanguage = normalizeConversationLanguage(
        session.selectedLanguage ??
            persona.selectedLanguage ??
            persona.defaultLanguage,
      );

      return persona.copyWith(selectedLanguage: selectedLanguage);
    }

    useEffect(() {
      final subscription = container.listen<TtsPlaybackState>(
        ttsPlaybackProvider,
        (prev, next) {
          if (!context.mounted) {
            sttResumeTimer.value?.cancel();
            return;
          }

          if (SttConfig.fullDuplexEnabled) {
            sttResumeTimer.value?.cancel();
            return;
          }

          final hasActivePlayback = next.hasActivePlayback;
          sttResumeTimer.value?.cancel();

          final sttNotifier = container.read(sttControllerProvider.notifier);
          final sttSnapshot = container.read(sttControllerProvider);
          final latestCallSession = container.read(
            callSessionControllerProvider,
          );

          if (hasActivePlayback) {
            if (sttSnapshot.isListening) {
              unawaited(sttNotifier.stopListening());
            }
            return;
          }

          final activeCharacter = currentCharacter.value;
          final shouldResume =
              activeCharacter != null &&
              (latestCallSession?.isMicMuted != true) &&
              (callState.value == CallState.active ||
                  callState.value == CallState.connecting);
          if (!shouldResume) {
            return;
          }

          sttResumeTimer.value = Timer(SttConfig.resumeDelay, () {
            if (!context.mounted) {
              return;
            }

            final latestCharacter = currentCharacter.value;
            if (latestCharacter == null) {
              return;
            }

            final latestTts = container.read(ttsPlaybackProvider);
            final latestStt = container.read(sttControllerProvider);
            if (latestStt.isListening) {
              return;
            }

            if (latestTts.hasActivePlayback) {
              return;
            }

            if (container.read(callSessionControllerProvider)?.isMicMuted ==
                true) {
              return;
            }

            if (callState.value != CallState.active &&
                callState.value != CallState.connecting) {
              return;
            }

            final language = normalizeConversationLanguage(
              container.read(callSessionControllerProvider)?.selectedLanguage ??
                  latestCharacter.selectedLanguage ??
                  latestCharacter.defaultLanguage,
            );
            unawaited(sttNotifier.startListening(localeId: language));
          });
        },
      );
      return () {
        sttResumeTimer.value?.cancel();
        subscription.close();
      };
    }, [callState.value, currentCharacter.value?.id, callSession?.isMicMuted]);

    useEffect(() {
      if (callState.value != CallState.connecting) {
        return null;
      }

      // Avoid staying in connecting forever if animation initialization stalls.
      final timer = Timer(const Duration(seconds: 10), () {
        if (!context.mounted) return;
        if (callState.value == CallState.connecting) {
          callState.value = CallState.active;
        }
      });

      return timer.cancel;
    }, [callState.value, currentCharacter.value?.id]);

    useEffect(
      () {
        final activeSession = callSession;
        final resolvedState = syncVideoViewFromSession(
          callSession: activeSession,
          resolvedCharacter: activeSession == null
              ? null
              : resolveCharacterForCall(activeSession),
          currentCallState: callState.value,
          currentCharacter: currentCharacter.value,
        );

        final nextCharacter = resolvedState.currentCharacter;
        final current = currentCharacter.value;
        final shouldUpdateCharacter = switch ((current, nextCharacter)) {
          (null, null) => false,
          (null, _) || (_, null) => true,
          _ =>
            current!.id != nextCharacter!.id ||
                current.selectedLanguage != nextCharacter.selectedLanguage,
        };
        if (shouldUpdateCharacter) {
          currentCharacter.value = nextCharacter;
        }

        if (callState.value != resolvedState.callState) {
          callState.value = resolvedState.callState;
        }

        return null;
      },
      [
        callSession?.sessionId,
        callSession?.characterId,
        callSession?.selectedLanguage,
        callSession?.state,
        characters.length,
        initialCharacter?.id,
      ],
    );

    List<PersonaProfile> filteredCharacters() {
      return characters.where((character) {
        if (filters.gender != null &&
            filters.gender!.isNotEmpty &&
            (character.gender ?? '').toLowerCase() !=
                filters.gender!.toLowerCase()) {
          return false;
        }

        return true;
      }).toList();
    }

    List<PersonaProfile> swipeSourceCharacters() {
      final filtered = filteredCharacters();
      return filtered.isEmpty ? characters : filtered;
    }

    PersonaProfile? resolveSwipeTarget({required bool forward}) {
      return resolveAdjacentCharacter(
        characters: swipeSourceCharacters(),
        currentCharacter: currentCharacter.value,
        forward: forward,
      );
    }

    void resetSwipePresentation() {
      swipeDragOffset.value = 0;
      swipeProgress.value = 0;
      swipeDirection.value = null;
      isSwipeAnimating.value = false;
    }

    void handleSwipePresentationChanged(
      VideoCharacterSwipePresentation presentation,
    ) {
      swipeDragOffset.value = presentation.dragOffset;
      swipeProgress.value = presentation.progress;
      swipeDirection.value = presentation.direction;
    }

    void syncSwipeNeighborsAndPreload() {
      final activeCharacter = currentCharacter.value;
      final swipeNeighbors = resolveSwipeNeighbors(
        characters: swipeSourceCharacters(),
        currentCharacter: activeCharacter,
      );
      swipePreviousCharacter.value = swipeNeighbors.previous;
      swipeNextCharacter.value = swipeNeighbors.next;
      RiveSceneCache.shared.warmAll([
        activeCharacter?.displayRiveAssetPath,
        swipeNeighbors.previous?.displayRiveAssetPath,
        swipeNeighbors.next?.displayRiveAssetPath,
      ]);
    }

    // Yeni sohbet başlat (izin kontrolü ile)
    Future<void> startChatWithCharacter(
      PersonaProfile character, {
      bool forceRestart = false,
      bool showFullscreenLoading = true,
    }) async {
      if (!forceRestart &&
          (callState.value == CallState.connecting ||
              callState.value == CallState.active)) {
        return;
      }

      final granted = await PermissionHelper.ensureVideoCallPermissions(
        context,
      );
      if (!granted) {
        return;
      }

      PersonaProfile? resolvedPersona;
      for (final persona in personasAsync.value ?? const <PersonaProfile>[]) {
        if (persona.id == character.id) {
          resolvedPersona = persona;
          break;
        }
      }

      final requestedCharacter = (resolvedPersona ?? character).copyWith(
        selectedLanguage: character.selectedLanguage,
      );
      currentCharacter.value = requestedCharacter;
      callState.value = CallState.connecting;
      showFullscreenConnectingOverlay.value = showFullscreenLoading;

      final session = await ref
          .read(callSessionControllerProvider.notifier)
          .startCall(persona: requestedCharacter, callType: CallType.video);
      final launchState = resolveVideoStartResult(
        requestedCharacter: requestedCharacter,
        session: session,
      );
      callState.value = launchState.callState;
      currentCharacter.value = launchState.currentCharacter;
      showFullscreenConnectingOverlay.value = false;
      if (session == null) {
        return;
      }
    }

    Future<void> switchCharacterBySwipe({required bool forward}) async {
      if (isCharacterSwitching.value) {
        return;
      }

      final isPremiumUser = user.asData?.value?.user.isPremium ?? false;
      if (!isPremiumUser) {
        final paywallResult = await RevenueCatUI.presentPaywall(
          offering: offerings.value?.current,
        );
        if (paywallResult == PaywallResult.purchased) {
          await ref.read(userProfileProvider.notifier).refresh();
        }
        return;
      }

      if (callState.value != CallState.active &&
          callState.value != CallState.connecting) {
        return;
      }

      final activeCharacter = currentCharacter.value;
      if (activeCharacter == null) {
        return;
      }

      final target = resolveSwipeTarget(forward: forward);
      if (target == null || target.id == activeCharacter.id) {
        return;
      }

      isCharacterSwitching.value = true;
      try {
        await startChatWithCharacter(
          target,
          forceRestart: true,
          showFullscreenLoading: false,
        );
      } finally {
        isCharacterSwitching.value = false;
      }
    }

    Future<void> toggleFollow() async {
      final activeCharacter = currentCharacter.value;
      if (activeCharacter == null || isFollowLoading.value) {
        return;
      }

      final shouldFollow = !activeCharacter.isFollowed;
      isFollowLoading.value = true;

      try {
        await ref
            .read(personaFollowControllerProvider)
            .setFollowed(
              personaId: activeCharacter.id,
              shouldFollow: shouldFollow,
            );
        currentCharacter.value = activeCharacter.copyWith(
          isFollowed: shouldFollow,
        );
      } catch (_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.videoChat.failedToUpdateFollow)),
          );
        }
      } finally {
        isFollowLoading.value = false;
      }
    }

    Future<void> fetchOfferings() async {
      if (isFetchingOfferings.value) return;
      isFetchingOfferings.value = true;
      try {
        final fetchedOfferings = await Purchases.getOfferings();
        if (!context.mounted) return;
        offerings.value = fetchedOfferings;
      } catch (_) {
        // Intentionally ignored: paywall can still be shown with default offerings.
      } finally {
        isFetchingOfferings.value = false;
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        fetchOfferings();
      });
      return null;
    }, const []);
    Future<void> handlePremiumBannerTap() async {
      if (offerings.value == null) {
        await fetchOfferings();
      }

      final paywallResult = await RevenueCatUI.presentPaywall(
        offering: offerings.value?.current,
      );

      if (paywallResult == PaywallResult.purchased) {
        await ref.read(userProfileProvider.notifier).refresh();
      }
    }

    void startNewChat() {
      if (!user.requireValue!.user.isPremium) {
        handlePremiumBannerTap();
        return;
      }
      final source = swipeSourceCharacters();
      if (source.isEmpty) return;
      final target = selectNextCharacterForNewChat(
        characters: source,
        initialCharacter: initialCharacter,
        currentCharacter: currentCharacter.value,
        callSession: callSession,
        lastAutoLaunchedInitialCharacterId:
            lastAutoLaunchedInitialCharacterId.value,
      );
      if (target == null) {
        return;
      }
      startChatWithCharacter(target);
    }

    useEffect(
      () {
        final character = initialCharacter;
        if (shouldAutoLaunchInitialCharacter(
          initialCharacter: character,
          callSession: callSession,
          lastAutoLaunchedInitialCharacterId:
              lastAutoLaunchedInitialCharacterId.value,
        )) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              lastAutoLaunchedInitialCharacterId.value = character!.id;
              unawaited(startChatWithCharacter(character, forceRestart: true));
            }
          });
        }
        return null;
      },
      [
        initialCharacter?.id,
        callSession?.sessionId,
        callSession?.characterId,
        callSession?.state,
        lastAutoLaunchedInitialCharacterId.value,
      ],
    );

    useEffect(
      () {
        syncSwipeNeighborsAndPreload();
        return null;
      },
      [
        currentCharacter.value?.id,
        currentCharacter.value?.selectedLanguage,
        characters.length,
        filters.gender,
        filters.language,
      ],
    );

    useEffect(() {
      resetSwipePresentation();
      return null;
    }, [currentCharacter.value?.id, callState.value]);

    useEffect(() {
      if (callState.value != CallState.connecting) {
        showFullscreenConnectingOverlay.value = false;
      }
      return null;
    }, [callState.value]);

    // Sohbet bitir
    void endChat() {
      callState.value = CallState.ended;
      currentCharacter.value = null;
      isCameraEnabled.value = true;
      activeCameraPosition.value = SensorPosition.front;
      selectedCameraFilter.value = cameraAwesomeFilters.first;
      final cameraState = cameraRuntimeState.value;
      if (cameraState != null) {
        unawaited(
          cameraState
              .setFilter(cameraAwesomeFilters.first)
              .then((_) {
                lastAppliedCameraFilterId.value = cameraAwesomeFilters.first.id;
              })
              .catchError((_) {}),
        );
      }
      callSessionNotifier.endCall();
    }

    Future<void> showCameraFilterPicker() async {
      String filterDisplayName(AwesomeFilter filter) {
        switch (filter.id) {
          case 'ORIGINAL':
            return context.t.videoView.filters.ORIGINAL;
          case 'ADDICTIVE_BLUE':
            return context.t.videoView.filters.ADDICTIVE_BLUE;
          case 'ADDICTIVE_RED':
            return context.t.videoView.filters.ADDICTIVE_RED;
          case 'ADEN':
            return context.t.videoView.filters.ADEN;
          case 'AMARO':
            return context.t.videoView.filters.AMARO;
          case 'ASHBY':
            return context.t.videoView.filters.ASHBY;
          case 'BRANNAN':
            return context.t.videoView.filters.BRANNAN;
          case 'BROOKLYN':
            return context.t.videoView.filters.BROOKLYN;
          case 'CLARENDON':
            return context.t.videoView.filters.CLARENDON;
          case 'CREMA':
            return context.t.videoView.filters.CREMA;
          case 'DOGPATCH':
            return context.t.videoView.filters.DOGPATCH;
          case 'GINGHAM':
            return context.t.videoView.filters.GINGHAM;
          case 'GINZA':
            return context.t.videoView.filters.GINZA;
          case 'HEFE':
            return context.t.videoView.filters.HEFE;
          case 'HUDSON':
            return context.t.videoView.filters.HUDSON;
          case 'INKWELL':
            return context.t.videoView.filters.INKWELL;
          case 'JUNO':
            return context.t.videoView.filters.JUNO;
          case 'LARK':
            return context.t.videoView.filters.LARK;
          case 'LOFI':
            return context.t.videoView.filters.LOFI;
          case 'LUDWIG':
            return context.t.videoView.filters.LUDWIG;
          case 'MOON':
            return context.t.videoView.filters.MOON;
          case 'PERPETUA':
            return context.t.videoView.filters.PERPETUA;
          case 'REYES':
            return context.t.videoView.filters.REYES;
          case 'SIERRA':
            return context.t.videoView.filters.SIERRA;
          case 'SLUMBER':
            return context.t.videoView.filters.SLUMBER;
          case 'STINSON':
            return context.t.videoView.filters.STINSON;
          case 'SUTRO':
            return context.t.videoView.filters.SUTRO;
          case 'WALDEN':
            return context.t.videoView.filters.WALDEN;
          case 'WILLOW':
            return context.t.videoView.filters.WILLOW;
          case 'XPROII':
            return context.t.videoView.filters.XPROII;
          default:
            return filter.name;
        }
      }

      final currentFilter =
          cameraAwesomeFilters.any(
            (filter) => filter.id == selectedCameraFilter.value.id,
          )
          ? selectedCameraFilter.value
          : cameraAwesomeFilters.first;

      final result = await showModalBottomSheet<AwesomeFilter>(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withValues(alpha: 0.55),
        isScrollControlled: true,
        builder: (bottomSheetContext) {
          var pendingFilter = currentFilter;
          return StatefulBuilder(
            builder: (modalContext, setModalState) {
              return SafeArea(
                top: false,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    gradient: const RadialGradient(
                      // CSS equivalent:
                      // radial-gradient(114.68% 114.68% at 113.74% -29.8%, #774487 0%, #000000 100%)
                      center: Alignment(1.2748, -1.596),
                      radius: 1.1468,
                      colors: [Color(0xFF774487), Color(0xFF000000)],
                      stops: [0.0, 1.0],
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.14),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                        child: Center(
                          child: Container(
                            width: 44,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.32),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
                        child: Text(
                          context.t.videoView.title,
                          style: AppTextStyles.body(
                            20,
                            color: Colors.white,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: Text(
                          context.t.videoView.subtitle,
                          style: AppTextStyles.body(
                            16,
                            weight: FontWeight.w400,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 46,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cameraAwesomeFilters.length,
                          separatorBuilder: (_, _) => const SizedBox(width: 10),
                          itemBuilder: (_, index) {
                            final filter = cameraAwesomeFilters[index];
                            final isSelected = filter.id == pendingFilter.id;
                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  pendingFilter = filter;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withValues(alpha: 0.11)
                                      : Colors.black.withValues(alpha: 0.25),
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.3),
                                    width: 1.3,
                                  ),
                                ),
                                child: Text(
                                  filterDisplayName(filter),
                                  style: AppTextStyles.body(
                                    16,
                                    color: Colors.white,
                                    weight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.of(
                                bottomSheetContext,
                              ).pop(pendingFilter);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFF753066),
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(56),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: Text(
                              context.t.videoView.saveFilter,
                              style: AppTextStyles.body(
                                16,
                                color: Colors.white,
                                letterSpacing: -0.05,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );

      if (result == null) return;
      selectedCameraFilter.value = cameraAwesomeFilters.firstWhere(
        (filter) => filter.id == result.id,
        orElse: () => cameraAwesomeFilters.first,
      );
      final cameraState = cameraRuntimeState.value;
      if (cameraState != null) {
        unawaited(
          cameraState
              .setFilter(selectedCameraFilter.value)
              .then((_) {
                lastAppliedCameraFilterId.value = selectedCameraFilter.value.id;
              })
              .catchError((_) {}),
        );
      }
    }

    Future<void> toggleCameraPreview() async {
      final nextValue = !isCameraEnabled.value;
      isCameraEnabled.value = nextValue;
    }

    Future<void> rotateCamera() async {
      final nextPosition = activeCameraPosition.value == SensorPosition.front
          ? SensorPosition.back
          : SensorPosition.front;
      activeCameraPosition.value = nextPosition;
    }

    if (characters.isEmpty) {
      return Center(
        child: Text(
          context.t.videoView.noComps,
          style: AppTextStyles.body(14, color: Colors.white70),
        ),
      );
    }

    final isCompanionSpeaking = ttsState.avatarSpeech.isTalking;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          return;
        }
        unawaited(callSessionNotifier.endCall());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            BlurredGradientBackground(),
            // Ana içerik
            if ((callState.value == CallState.active ||
                    callState.value == CallState.connecting) &&
                currentCharacter.value != null)
              Stack(
                children: [
                  VideoActiveScreen(
                    character: currentCharacter.value!,
                    characterStage: VideoCharacterSwipeDeck(
                      currentCharacter: currentCharacter.value!,
                      previousCharacter: swipePreviousCharacter.value,
                      nextCharacter: swipeNextCharacter.value,
                      isInteractionEnabled:
                          !isCharacterSwitching.value &&
                          !isSwipeAnimating.value &&
                          swipeSourceCharacters().length > 1,
                      onPresentationChanged: handleSwipePresentationChanged,
                      onCommitSwipe: (direction) async {
                        if (isCharacterSwitching.value ||
                            isSwipeAnimating.value) {
                          return;
                        }

                        isSwipeAnimating.value = true;
                        try {
                          await switchCharacterBySwipe(
                            forward: direction == VideoSwipeDirection.left,
                          );
                        } finally {
                          resetSwipePresentation();
                        }
                      },
                      stageBuilder: (context, character, isPreview) {
                        return VideoCharacterStage(
                          character: character,
                          isCompanionSpeaking: isPreview
                              ? false
                              : isCompanionSpeaking,
                          activeVisemeId: isPreview
                              ? 0
                              : ttsState.avatarSpeech.visemeId,
                          activeVisemeDurationMs: isPreview
                              ? 0
                              : ttsState.avatarSpeech.durationMs,
                          onMediaReady: null,
                        );
                      },
                    ),
                    onSceneReady: () {},
                    onClose: endChat,
                    onFollow: toggleFollow,
                    isFollowed: currentCharacter.value!.isFollowed,
                    onSwipeToChat: () {
                      if (currentCharacter.value != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ChatView(persona: currentCharacter.value!),
                          ),
                        );
                      }
                    },
                    onCameraStateChanged: (state) {
                      cameraRuntimeState.value = state;
                      final selectedFilterId = selectedCameraFilter.value.id;
                      if (lastAppliedCameraFilterId.value == selectedFilterId) {
                        return;
                      }
                      unawaited(
                        state
                            .setFilter(selectedCameraFilter.value)
                            .then((_) {
                              lastAppliedCameraFilterId.value =
                                  selectedFilterId;
                            })
                            .catchError((_) {}),
                      );
                    },
                    isCameraEnabled: isCameraEnabled.value,
                    cameraPosition: activeCameraPosition.value,
                    selectedFilter: selectedCameraFilter.value,
                    isMicMuted: callSession?.isMicMuted ?? false,
                    isCompanionSpeaking: isCompanionSpeaking,
                    activeVisemeId: ttsState.avatarSpeech.visemeId,
                    activeVisemeDurationMs: ttsState.avatarSpeech.durationMs,
                  ),
                  if (callState.value == CallState.connecting &&
                      showFullscreenConnectingOverlay.value)
                    _VideoConnectingOverlay(character: currentCharacter.value!),
                  if (callState.value == CallState.connecting &&
                      !showFullscreenConnectingOverlay.value)
                    const _VideoInlineConnectingBadge(),
                ],
              )
            else if (callState.value == CallState.ended)
              VideoEndedScreen(onSwipeForNewChat: startNewChat)
            else
              VideoIdleScreen(
                onSwipeForNewChat: startNewChat,
                cameraPosition: activeCameraPosition.value,
                selectedFilter: selectedCameraFilter.value,
              ),

            // Üst bar: Profil avatarı + Premium badge
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 16,
              right: 16,
              child: VideoPageHeader(
                onClose: endChat,
                isCallEnded: callState.value == CallState.ended,
                isInCall: callState.value != CallState.idle,
              ),
            ),
            // Sol sidebar
            Positioned(
              left: 12,
              top: MediaQuery.of(context).size.height * 0.35,
              child: VideoSidebar(
                onFilterTapped: showCameraFilterPicker,
                onCameraTap: toggleCameraPreview,
                onRotateTap: rotateCamera,
                cameraIconAsset: isCameraEnabled.value
                    ? AppIcons.videoCall
                    : AppIcons.cameraslash,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              child: VideoFilterBar(
                selectedGender: filters.gender,
                selectedLanguage:
                    callSession?.selectedLanguage ??
                    currentCharacter.value?.selectedLanguage ??
                    filters.language,
                onGenderChanged: (value) {
                  if (value != null) {
                    unawaited(
                      ref.read(personaFilterProvider.notifier).setGender(value),
                    );
                  }
                },
                onLanguageChanged: (value) {
                  if (value != null) {
                    final normalizedLanguage = normalizeConversationLanguage(
                      value,
                    );
                    LocaleSettings.setLocale(
                      AppLocale.values.byName(normalizedLanguage),
                    );
                    unawaited(
                      SecureStorageService().saveLanguage(normalizedLanguage),
                    );
                    final activeCharacter = currentCharacter.value;
                    if (activeCharacter != null) {
                      currentCharacter.value = activeCharacter.copyWith(
                        selectedLanguage: normalizedLanguage,
                      );
                    }
                    if (callSession != null) {
                      unawaited(
                        callSessionNotifier.changeLanguage(normalizedLanguage),
                      );
                    } else {
                      unawaited(
                        ref
                            .read(personaFilterProvider.notifier)
                            .setLanguage(normalizedLanguage),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoConnectingOverlay extends StatelessWidget {
  const _VideoConnectingOverlay({required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final avatarPath = character.displayImagePath;
    final isNetworkAvatar = character.isNetworkImage;

    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.68),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CallAvatar(
                    avatarImagePath: avatarPath,
                    name: character.name,
                    statusText: context.t.videoChat.connecting,
                    isNetworkImage: isNetworkAvatar,
                    avatarSize: 150,
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VideoInlineConnectingBadge extends StatelessWidget {
  const _VideoInlineConnectingBadge();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 74,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.52),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.12),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
                Text(
                  context.t.videoChat.connecting,
                  style: AppTextStyles.body(
                    13,
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
