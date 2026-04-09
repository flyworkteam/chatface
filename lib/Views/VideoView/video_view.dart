import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/Views/CallView/widgets/call_avatar.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Views/VideoView/widgets/video_active_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_ended_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_filter_bar.dart';
import 'package:chatface/Views/VideoView/widgets/video_idle_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_page_header.dart';
import 'package:chatface/Views/VideoView/widgets/video_sidebar.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final sttResumeTimer = useRef<Timer?>(null);

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
    if (personasAsync.isLoading || filteredPersonasAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (personasAsync.hasError || filteredPersonasAsync.hasError) {
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
        if (activeSession == null) {
          return null;
        }

        final resolvedCharacter = resolveCharacterForCall(activeSession);
        final current = currentCharacter.value;
        if (resolvedCharacter != null &&
            (current == null ||
                current.id != resolvedCharacter.id ||
                current.selectedLanguage !=
                    resolvedCharacter.selectedLanguage)) {
          currentCharacter.value = resolvedCharacter;
        }

        final targetState = activeSession.state == CallState.ended
            ? CallState.ended
            : CallState.active;
        if (callState.value != targetState) {
          callState.value = targetState;
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

    // Yeni sohbet başlat (izin kontrolü ile)
    Future<void> startChatWithCharacter(
      PersonaProfile character, {
      bool forceRestart = false,
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

      final persona = personasAsync.value?.firstWhere(
        (p) => p.id == character.id,
        orElse: () => PersonaProfile.fallback(
          id: character.id,
          name: character.name,
          defaultLanguage: character.resolveLanguage(),
          isFollowed: character.isFollowed,
          gender: character.gender,
          selectedLanguage: character.selectedLanguage,
          avatarUrl: character.avatarUrl,
          riveAssetUrl: character.riveAssetUrl,
          isActive: character.isActive,
          availableLanguageCodes: character.availableLanguageCodes,
        ),
      );

      currentCharacter.value = (persona ?? character).copyWith(
        selectedLanguage: character.selectedLanguage,
      );
      callState.value = CallState.connecting;

      if (persona != null) {
        final session = await ref
            .read(callSessionControllerProvider.notifier)
            .startCall(
              persona: persona.copyWith(
                selectedLanguage: character.selectedLanguage,
              ),
              callType: CallType.video,
            );
        if (session == null) {
          callState.value = CallState.idle;
          currentCharacter.value = null;
          return;
        }
      }
    }

    Future<void> switchCharacterBySwipe({required bool forward}) async {
      if (isCharacterSwitching.value) {
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

      final filtered = filteredCharacters();
      final source = filtered.isEmpty ? characters : filtered;
      if (source.length < 2) {
        return;
      }

      final currentIndex = source.indexWhere((p) => p.id == activeCharacter.id);
      final baseIndex = currentIndex >= 0 ? currentIndex : 0;
      final targetIndex = forward
          ? (baseIndex + 1) % source.length
          : (baseIndex - 1 + source.length) % source.length;
      final target = source[targetIndex];
      if (target.id == activeCharacter.id) {
        return;
      }

      isCharacterSwitching.value = true;
      try {
        await startChatWithCharacter(target, forceRestart: true);
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

    void startNewChat() {
      final filtered = filteredCharacters();
      final source = filtered.isEmpty ? characters : filtered;
      if (source.isEmpty) return;
      startChatWithCharacter(source.first);
    }

    useEffect(() {
      final character = initialCharacter;
      if (character != null && callSession == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            startChatWithCharacter(character);
          }
        });
      }
      return null;
    }, [initialCharacter?.id, callSession?.sessionId]);

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
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            bottom: true,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF16161A).withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 48,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        context.t.videoView.title,
                        style: AppTextStyles.body(
                          20,
                          color: Colors.white,
                          weight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        context.t.videoView.subtitle,
                        style: AppTextStyles.body(14, color: Colors.white70),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cameraAwesomeFilters.length,
                          itemBuilder: (context, index) {
                            final filter = cameraAwesomeFilters[index];
                            final isSelected = filter.id == currentFilter.id;
                            return GestureDetector(
                              onTap: () => Navigator.of(context).pop(filter),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOutCubic,
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? const LinearGradient(
                                          colors: [
                                            Color(0xFF8A2BE2),
                                            Color(0xFF4B0082),
                                          ],
                                        )
                                      : null,
                                  color: isSelected
                                      ? null
                                      : Colors.white.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.white.withValues(alpha: 0.5)
                                        : Colors.transparent,
                                    width: 1.5,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF8A2BE2,
                                            ).withValues(alpha: 0.4),
                                            blurRadius: 12,
                                            spreadRadius: 2,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Text(
                                  filterDisplayName(filter),
                                  style: AppTextStyles.body(
                                    14,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    weight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            // Ana içerik
            if ((callState.value == CallState.active ||
                    callState.value == CallState.connecting) &&
                currentCharacter.value != null)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (details) {
                  final velocity = details.primaryVelocity;
                  if (velocity == null || velocity.abs() < 250) {
                    return;
                  }

                  if (velocity < 0) {
                    unawaited(switchCharacterBySwipe(forward: true));
                    return;
                  }

                  unawaited(switchCharacterBySwipe(forward: false));
                },
                child: Stack(
                  children: [
                    VideoActiveScreen(
                      character: currentCharacter.value!,
                      onSceneReady: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!context.mounted) return;
                          if (callState.value == CallState.connecting) {
                            callState.value = CallState.active;
                          }
                        });
                      },
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
                        if (lastAppliedCameraFilterId.value ==
                            selectedFilterId) {
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
                    if (callState.value == CallState.connecting)
                      _VideoConnectingOverlay(
                        character: currentCharacter.value!,
                      ),
                  ],
                ),
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
