import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/Views/CallView/widgets/call_avatar.dart';
import 'package:chatface/Views/CallView/widgets/call_language_picker.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Views/VideoView/widgets/video_active_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_filter_bar.dart';
import 'package:chatface/Views/VideoView/widgets/video_idle_screen.dart';
import 'package:chatface/Views/VideoView/widgets/video_page_header.dart';
import 'package:chatface/Views/VideoView/widgets/video_sidebar.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/utils/permission_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoView extends HookConsumerWidget {
  const VideoView({super.key, this.initialCharacter});

  final PersonaProfile? initialCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasAsync = ref.watch(personaListProvider);
    final filteredPersonasAsync = ref.watch(filteredPersonaListProvider);
    final sttState = ref.watch(sttControllerProvider);
    final ttsState = ref.watch(ttsPlaybackProvider);
    final callSession = ref.watch(callSessionControllerProvider);
    final callSessionNotifier = ref.read(
      callSessionControllerProvider.notifier,
    );
    final sttResumeTimer = useRef<Timer?>(null);

    useEffect(() {
      ref.listen<SttState>(sttControllerProvider, (prev, next) {
        if (!context.mounted) return;
        if (prev?.streamStatus != StreamingSttStatus.error &&
            next.streamStatus == StreamingSttStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Network hiccup detected. Reconnecting mic...'),
            ),
          );
        }
      });
      return () => sttResumeTimer.value?.cancel();
    }, const []);
    if (personasAsync.isLoading || filteredPersonasAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (personasAsync.hasError || filteredPersonasAsync.hasError) {
      return Center(
        child: Text(
          'Failed to load companions: ${personasAsync.error ?? filteredPersonasAsync.error}',
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    // State
    final callState = useState(CallState.idle);
    final currentCharacter = useState<PersonaProfile?>(null);
    final isCameraEnabled = useState(true);
    final activeCameraPosition = useState(SensorPosition.front);
    final selectedCameraFilter = useState<AwesomeFilter>(
      awesomePresetFiltersList.first,
    );
    final filters = ref.watch(personaFilterProvider);
    final isFollowLoading = useState(false);
    final characters =
        filteredPersonasAsync.value?.map((persona) {
          final resolvedLanguage = persona.resolveLanguage(filters.language);
          return persona.copyWith(selectedLanguage: resolvedLanguage);
        }).toList() ??
        const [];

    useEffect(() {
      ref.listen<TtsPlaybackState>(ttsPlaybackProvider, (prev, next) {
        if (SttConfig.fullDuplexEnabled) {
          sttResumeTimer.value?.cancel();
          return;
        }

        final hasActivePlayback = next.hasActivePlayback;
        sttResumeTimer.value?.cancel();

        final sttNotifier = ref.read(sttControllerProvider.notifier);
        final sttSnapshot = ref.read(sttControllerProvider);
        final latestCallSession = ref.read(callSessionControllerProvider);

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
          final latestCharacter = currentCharacter.value;
          if (latestCharacter == null) {
            return;
          }

          final latestTts = ref.read(ttsPlaybackProvider);
          final latestStt = ref.read(sttControllerProvider);
          if (latestStt.isListening) {
            return;
          }

          if (latestTts.hasActivePlayback) {
            return;
          }

          if (ref.read(callSessionControllerProvider)?.isMicMuted == true) {
            return;
          }

          if (callState.value != CallState.active &&
              callState.value != CallState.connecting) {
            return;
          }

          final language =
              ref.read(callSessionControllerProvider)?.selectedLanguage ??
              latestCharacter.resolveLanguage(latestCharacter.selectedLanguage);
          unawaited(sttNotifier.startListening(localeId: language));
        });
      });
      return null;
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

    List<PersonaProfile> filteredCharacters() {
      return characters.where((character) {
        if (filters.gender != null &&
            filters.gender!.isNotEmpty &&
            (character.gender ?? '').toLowerCase() !=
                filters.gender!.toLowerCase()) {
          return false;
        }
        if (filters.language != null &&
            filters.language!.isNotEmpty &&
            !character.availableLanguageCodes
                .map((code) => code.toLowerCase())
                .contains(filters.language!.toLowerCase()) &&
            character.resolveLanguage().toLowerCase() !=
                filters.language!.toLowerCase()) {
          return false;
        }
        return true;
      }).toList();
    }

    // Yeni sohbet başlat (izin kontrolü ile)
    Future<void> startChatWithCharacter(PersonaProfile character) async {
      if (callState.value == CallState.connecting ||
          callState.value == CallState.active) {
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
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Camera and microphone permissions are needed for video calls.',
                ),
              ),
            );
          }
          callState.value = CallState.idle;
          currentCharacter.value = null;
          return;
        }
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
            const SnackBar(content: Text('Failed to update follow status.')),
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
      if (character != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            startChatWithCharacter(character);
          }
        });
      }
      return null;
    }, [initialCharacter?.id]);

    useEffect(() {
      return () {
        unawaited(callSessionNotifier.endCall());
      };
    }, [callSessionNotifier]);

    // Sohbet bitir
    void endChat() {
      callState.value = CallState.ended;
      currentCharacter.value = null;
      isCameraEnabled.value = true;
      activeCameraPosition.value = SensorPosition.front;
      selectedCameraFilter.value = awesomePresetFiltersList.first;
      callSessionNotifier.endCall();
    }

    Future<void> showCameraFilterPicker() async {
      final currentFilter = selectedCameraFilter.value;
      final result = await showModalBottomSheet<AwesomeFilter>(
        context: context,
        backgroundColor: const Color(0xFF111111),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) {
          return SafeArea(
            top: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Camera filters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose the look for your camera preview.',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (final filter in awesomePresetFiltersList)
                              ChoiceChip(
                                label: Text(filter.name),
                                selected: filter.id == currentFilter.id,
                                onSelected: (_) =>
                                    Navigator.of(context).pop(filter),
                                labelStyle: TextStyle(
                                  color: filter.id == currentFilter.id
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                selectedColor: Colors.white,
                                backgroundColor: Colors.white12,
                                side: BorderSide(
                                  color: filter.id == currentFilter.id
                                      ? Colors.white
                                      : Colors.white24,
                                ),
                                showCheckmark: false,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      if (result == null) {
        return;
      }

      selectedCameraFilter.value = result;
    }

    Future<void> toggleCameraPreview() async {
      final nextValue = !isCameraEnabled.value;
      isCameraEnabled.value = nextValue;
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            nextValue ? 'Camera preview enabled.' : 'Camera preview disabled.',
          ),
          duration: const Duration(milliseconds: 1400),
        ),
      );
    }

    Future<void> rotateCamera() async {
      final nextPosition = activeCameraPosition.value == SensorPosition.front
          ? SensorPosition.back
          : SensorPosition.front;
      activeCameraPosition.value = nextPosition;

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            nextPosition == SensorPosition.front
                ? 'Front camera selected.'
                : 'Back camera selected.',
          ),
          duration: const Duration(milliseconds: 1400),
        ),
      );
    }

    Future<void> showGenderPicker() async {
      final result = await showModalBottomSheet<String>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16),
          child: GenderPickerSheet(selectedGender: filters.gender),
        ),
      );
      if (result != null && context.mounted) {
        await ref.read(personaFilterProvider.notifier).setGender(result);
      }
    }

    Future<void> showLanguagePicker() async {
      final result = await showModalBottomSheet<String>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16),
          child: LanguagePickerSheet(selectedLanguage: filters.language),
        ),
      );
      if (result != null && context.mounted) {
        await ref.read(personaFilterProvider.notifier).setLanguage(result);
      }
    }

    if (characters.isEmpty) {
      return const Center(
        child: Text(
          'No companions available yet.',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    final isCompanionSpeaking = ttsState.avatarSpeech.isTalking;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Ana içerik
          if ((callState.value == CallState.active ||
                  callState.value == CallState.connecting) &&
              currentCharacter.value != null)
            Stack(
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
                  onFilterTapped: showCameraFilterPicker,
                  onCameraToggle: toggleCameraPreview,
                  onRotate: rotateCamera,
                  onCameraStateChanged: (_) {},
                  isCameraEnabled: isCameraEnabled.value,
                  cameraPosition: activeCameraPosition.value,
                  selectedFilter: selectedCameraFilter.value,
                  isMicMuted: callSession?.isMicMuted ?? false,
                  isCompanionSpeaking: isCompanionSpeaking,
                  activeVisemeId: ttsState.avatarSpeech.visemeId,
                  activeVisemeDurationMs: ttsState.avatarSpeech.durationMs,
                  onLanguageTap: () async {
                    final callSession = ref.read(callSessionControllerProvider);
                    final selected = await showCallLanguagePicker(
                      context,
                      currentLanguage: callSession?.selectedLanguage ?? 'en',
                      supportedLanguages:
                          currentCharacter.value?.availableLanguageCodes,
                    );
                    if (selected != null && context.mounted) {
                      ref
                          .read(callSessionControllerProvider.notifier)
                          .changeLanguage(selected);
                      currentCharacter.value = currentCharacter.value!.copyWith(
                        selectedLanguage: selected,
                      );
                    }
                  },
                ),
                if (callState.value == CallState.connecting)
                  _VideoConnectingOverlay(character: currentCharacter.value!),
              ],
            )
          else
            VideoIdleScreen(onSwipeForNewChat: startNewChat),

          // Idle state'te sidebar (aktif state'te VideoActiveScreen içinde)
          if (callState.value == CallState.idle)
            Positioned(
              left: 12,
              top: MediaQuery.of(context).size.height * 0.35,
              child: VideoSidebar(
                onFilterTapped: () {},
                onCameraTap: () {},
                onRotateTap: () {},
              ),
            ),

          // Üst bar: Profil avatarı + Premium badge
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: VideoPageHeader(
              onClose: endChat,
              isInCall: callState.value != CallState.idle,
            ),
          ),

          // Alt: Filtre bar (her iki durumda da göster)
          if (callState.value == CallState.idle)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              child: VideoFilterBar(
                selectedGender: filters.gender,
                selectedLanguage: filters.language,
                onGenderTap: showGenderPicker,
                onLanguageTap: showLanguagePicker,
              ),
            ),
          if (!kReleaseMode && sttState.debugStatus != null)
            Positioned(
              left: 16,
              bottom: kToolbarHeight * 1.2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'STT: ${sttState.debugStatus}',
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ),
            ),
        ],
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
                    statusText: 'Connecting...',
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
