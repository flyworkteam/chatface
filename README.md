# chatface

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Whisper Streaming STT

- The mobile client now streams 16 kHz mono PCM chunks (~200 ms) via the realtime WebSocket so the backend can forward audio to Whisper and return `stt_partial` / `stt_transcript` events without needing on-device transcription.
- Streaming can be toggled at build time with Dart defines (defaults shown in `lib/config/stt_config.dart`):
  - `--dart-define=STT_STREAM_ENABLED=true`
  - `--dart-define=STT_SAMPLE_RATE=16000`, `STT_CHUNK_MS=200`, `STT_MAX_LAG_MS=1200`
- No extra permissions beyond the microphone are required for STT.

### Post-Iteration QA Checklist

1. Start a voice and video call; confirm the mic badge transitions through `Connecting mic → Listening` within ~1s and server `stt_partial` text surfaces live.
2. Simulate a network drop (disable Wi-Fi) and verify the UI shows `Reconnecting…` and the snackbar prompts the user.
3. End the call and ensure `stop` sends `stt_stream_stop` (no lingering mic indicator, and the console logs show the stream closing).
