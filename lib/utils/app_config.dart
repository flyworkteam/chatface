class AppConfig {
  static const String _defaultApiBase = String.fromEnvironment(
    'CHATFACE_API_BASE',
    defaultValue: 'https://chatface.fly-work.com/api/',
  );

  static const String _defaultRealtimeBase = String.fromEnvironment(
    'CHATFACE_WS_BASE',
    defaultValue: 'wss://chatface.fly-work.com/realtime',
  );

  static String apiBaseUrl() => _defaultApiBase;

  static String realtimeBaseUrl() => _defaultRealtimeBase;
}

// import 'dart:io';

// import 'package:flutter/foundation.dart';

// class AppConfig {
//   static const String _defaultApiBase = String.fromEnvironment(
//     'CHATFACE_API_BASE',
//     defaultValue: 'http://localhost:3000/api/',
//   );

//   static const String _defaultRealtimeBase = String.fromEnvironment(
//     'CHATFACE_WS_BASE',
//     defaultValue: 'ws://localhost:3000/realtime',
//   );

//   static String apiBaseUrl() => _normalize(_defaultApiBase);

//   static String realtimeBaseUrl() => _normalize(_defaultRealtimeBase);

//   static String _normalize(String base) {
//     if (kIsWeb) return base;

//     final uri = Uri.parse(base);
//     final host = uri.host;

//     if (!_isLocalhost(host)) return base;

//     final resolvedHost = _resolveHost();

//     return uri.replace(host: resolvedHost).toString();
//   }

//   static bool _isLocalhost(String host) {
//     return host == 'localhost' || host == '127.0.0.1';
//   }

//   static String _resolveHost() {
//     if (Platform.isAndroid) {
//       // 👇 ÖNEMLİ
//       // Eğer adb reverse kullanıyorsan:
//       return '127.0.0.1';

//       // Eğer kullanmıyorsan bunu aç:
//       // return '192.168.1.50'; // kendi IP’n
//     }

//     if (Platform.isIOS || Platform.isMacOS) {
//       return 'localhost';
//     }

//     return 'localhost';
//   }
// }
