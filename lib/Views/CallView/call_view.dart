import 'dart:async';

import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/Views/CallView/widgets/call_avatar.dart';
import 'package:chatface/Views/CallView/widgets/call_controls.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/utils/permission_helper.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// CallView - Sesli arama ekranı
/// Mikrofon + konuşma izni olmadan başlamaz
class CallView extends HookConsumerWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final character =
        args?['character'] as PersonaProfile? ??
        PersonaProfile.fallback(
          id: 'mock-1',
          name: 'Emma',
          gender: 'female',
          defaultLanguage: 'en',
        );

    final personasAsync = ref.watch(personaListProvider);
    final callSession = ref.watch(callSessionControllerProvider);
    final callSessionNotifier = ref.read(
      callSessionControllerProvider.notifier,
    );

    useEffect(() {
      ref.listen<SttState>(sttControllerProvider, (prev, next) {
        if (!context.mounted) return;
        if ((prev?.streamStatus != StreamingSttStatus.error) &&
            next.streamStatus == StreamingSttStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Network issue detected. Reconnecting the microphone...',
              ),
            ),
          );
        }
      });
      return null;
    }, const []);

    final callState = useState(CallState.idle);
    final callDuration = useState(Duration.zero);
    final hasPermission = useState<bool?>(null);
    final isConnecting = useRef(false);
    final sttResumeTimer = useRef<Timer?>(null);
    final persona = _resolvePersona(personasAsync.value, character);

    useEffect(() {
      Future<void> checkPermission() async {
        final granted = await PermissionHelper.requestVoiceCallPermissions();
        hasPermission.value = granted;
      }

      checkPermission();
      return () => sttResumeTimer.value?.cancel();
    }, []);

    useEffect(
      () {
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

          final shouldResume =
              hasPermission.value == true &&
              (latestCallSession?.isMicMuted != true) &&
              (callState.value == CallState.active ||
                  callState.value == CallState.connecting);
          if (!shouldResume) {
            return;
          }

          sttResumeTimer.value = Timer(SttConfig.resumeDelay, () {
            final latestTts = ref.read(ttsPlaybackProvider);
            final latestStt = ref.read(sttControllerProvider);
            if (latestStt.isListening) {
              return;
            }

            if (latestTts.hasActivePlayback) {
              return;
            }

            if (hasPermission.value != true ||
                ref.read(callSessionControllerProvider)?.isMicMuted == true ||
                (callState.value != CallState.active &&
                    callState.value != CallState.connecting)) {
              return;
            }

            final language =
                ref.read(callSessionControllerProvider)?.selectedLanguage ??
                persona.resolveLanguage(persona.selectedLanguage);
            unawaited(sttNotifier.startListening(localeId: language));
          });
        });
        return null;
      },
      [
        persona.id,
        hasPermission.value,
        callState.value,
        callSession?.isMicMuted,
      ],
    );

    useEffect(() {
      if (callState.value == CallState.active) {
        final stopwatch = Stopwatch()..start();
        final ticker = Stream.periodic(const Duration(seconds: 1));
        final subscription = ticker.listen((_) {
          callDuration.value = stopwatch.elapsed;
        });
        return () {
          stopwatch.stop();
          subscription.cancel();
        };
      }
      return null;
    }, [callState.value]);

    Future<void> connectCall() async {
      if (hasPermission.value != true ||
          isConnecting.value ||
          callState.value == CallState.active) {
        return;
      }
      isConnecting.value = true;
      callState.value = CallState.connecting;

      final session = await ref
          .read(callSessionControllerProvider.notifier)
          .startCall(persona: persona, callType: CallType.voice);

      if (session == null) {
        callState.value = CallState.idle;
      } else {
        callState.value = CallState.active;
      }
      isConnecting.value = false;
    }

    useEffect(() {
      connectCall();
      return null;
    }, [hasPermission.value, persona.id]);

    useEffect(() {
      return () {
        unawaited(callSessionNotifier.endCall());
      };
    }, const []);

    String formatDuration(Duration d) {
      final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
      final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }

    if (hasPermission.value == false) {
      return _PermissionRequired(
        onRetry: () async {
          final granted = await PermissionHelper.ensureVoiceCallPermissions(
            context,
          );
          Print.info(granted);
          hasPermission.value = granted;
          if (granted) {
            connectCall();
          }
        },
      );
    }

    if (hasPermission.value == null) {
      return const _CallScaffold(
        child: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    final statusText = switch (callState.value) {
      CallState.active => formatDuration(callDuration.value),
      CallState.connecting => context.t.voiceChat.connecting,
      CallState.ringing => context.t.voiceChat.calling,
      CallState.ended => context.t.voiceChat.callEnded,
      _ => 'Preparing call...',
    };

    final avatarPath = character.displayImagePath;
    final isNetwork = character.isNetworkImage;

    return _CallScaffold(
      child: Column(
        children: [
          const Spacer(flex: 2),
          CallAvatar(
            avatarImagePath: avatarPath,
            name: character.name,
            statusText: statusText,
            isNetworkImage: isNetwork,
          ),

          const SizedBox(height: 48),

          const Spacer(flex: 3),
          // Language picker button
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: CallControls(
              isMicMuted: callSession?.isMicMuted ?? false,
              isSpeakerOn: callSession?.isSpeakerOn ?? true,
              onMicToggle: () {
                unawaited(
                  ref
                      .read(callSessionControllerProvider.notifier)
                      .toggleMicMuted(),
                );
              },
              onEndCall: () {
                callState.value = CallState.ended;
                unawaited(
                  ref.read(callSessionControllerProvider.notifier).endCall(),
                );
                Navigator.of(context).pop();
              },
              onSpeakerToggle: () {
                unawaited(
                  ref
                      .read(callSessionControllerProvider.notifier)
                      .toggleSpeaker(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CallScaffold extends StatelessWidget {
  const _CallScaffold({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlurredGradientBackground(),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

class _PermissionRequired extends StatelessWidget {
  const _PermissionRequired({required this.onRetry});
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return _CallScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.mic_off_rounded,
                color: Colors.white54,
                size: 64,
              ),
              const SizedBox(height: 24),
              Text(
                'Microphone and speech permissions are required for voice calls.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      onRetry();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7C3AED),
                    ),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PersonaProfile _resolvePersona(
  List<PersonaProfile>? personas,
  PersonaProfile character,
) {
  if (personas == null || personas.isEmpty) {
    return PersonaProfile.fallback(
      id: character.id,
      name: character.name,
      defaultLanguage: character.resolveLanguage(),
      gender: character.gender,
      selectedLanguage: character.selectedLanguage,
      avatarUrl: character.avatarUrl,
      riveAssetUrl: character.riveAssetUrl,
      isActive: character.isActive,
      availableLanguageCodes: character.availableLanguageCodes,
    );
  }

  for (final persona in personas) {
    if (persona.id == character.id) {
      return persona.copyWith(
        selectedLanguage:
            character.selectedLanguage ?? persona.selectedLanguage,
      );
    }
  }

  return PersonaProfile.fallback(
    id: character.id,
    name: character.name,
    defaultLanguage: character.resolveLanguage(),
    gender: character.gender,
    selectedLanguage: character.selectedLanguage,
    avatarUrl: character.avatarUrl,
    riveAssetUrl: character.riveAssetUrl,
    isActive: character.isActive,
    availableLanguageCodes: character.availableLanguageCodes,
  );
}
