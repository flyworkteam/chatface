class AppConfig {
  static const String _defaultApiBase = String.fromEnvironment(
    'CHATFACE_API_BASE',
    defaultValue: 'https://chatface.fly-work.com/api/',
  );

  static const String _defaultRealtimeBase = String.fromEnvironment(
    'CHATFACE_WS_BASE',
    defaultValue: 'https://chatface.fly-work.com/realtime',
  );

  static String apiBaseUrl() => _defaultApiBase;

  static String realtimeBaseUrl() => _defaultRealtimeBase;
}
