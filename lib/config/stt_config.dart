class SttConfig {
  const SttConfig._();

  static const int sampleRate = int.fromEnvironment(
    'STT_SAMPLE_RATE',
    defaultValue: 16000,
  );

  static const int chunkMs = int.fromEnvironment(
    'STT_CHUNK_MS',
    defaultValue: 200,
  );

  static const int maxLagMs = int.fromEnvironment(
    'STT_MAX_LAG_MS',
    defaultValue: 1200,
  );

  static const int partialThrottleMs = int.fromEnvironment(
    'STT_PARTIAL_THROTTLE_MS',
    defaultValue: 150,
  );

  static const int resumeDelayMs = int.fromEnvironment(
    'STT_RESUME_DELAY_MS',
    defaultValue: 900,
  );

  static const bool streamingEnabled = bool.fromEnvironment(
    'STT_STREAM_ENABLED',
    defaultValue: true,
  );

  static const bool fullDuplexEnabled = bool.fromEnvironment(
    'STT_FULL_DUPLEX_ENABLED',
    defaultValue: false,
  );

  static const bool echoCancellationEnabled = bool.fromEnvironment(
    'STT_ECHO_CANCELLATION_ENABLED',
    defaultValue: true,
  );

  static const bool noiseSuppressionEnabled = bool.fromEnvironment(
    'STT_NOISE_SUPPRESSION_ENABLED',
    defaultValue: true,
  );

  static const bool autoGainEnabled = bool.fromEnvironment(
    'STT_AUTO_GAIN_ENABLED',
    defaultValue: true,
  );

  static Duration get chunkDuration => Duration(milliseconds: chunkMs);

  static Duration get maxLag => Duration(milliseconds: maxLagMs);

  static Duration get resumeDelay => Duration(milliseconds: resumeDelayMs);

  static int pcmBytesPerChunk([int rate = sampleRate]) {
    final samplesPerChunk = (rate * chunkMs) ~/ 1000;
    return samplesPerChunk * 2; // 16-bit PCM
  }
}
