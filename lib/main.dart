import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Riverpod/Providers/notification_provider.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Views/SplashView/splash_view.dart';
import 'package:chatface/firebase_options.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/constants.dart';
import 'package:chatface/utils/print.dart' hide LogLevel;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rive/rive.dart';

Future<void> initPlatformState() async {
  const String googleApiKey = 'goog_OAxirHSyvDPcWTHUnGYAuamjJrL';
  const String appleApiKey = 'appl_TlIFZylFLfyeLkYmNcCJlsbsGkT';

  await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.info);

  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    await Purchases.configure(PurchasesConfiguration(appleApiKey));
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    await Purchases.configure(PurchasesConfiguration(googleApiKey));
  }

  Print.info('RevenueCat initialized', tag: 'Main');
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  FlutterNativeSplash.remove();
  await RiveNative.init();
  await initPlatformState();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OneSignal.initialize("1549a5b3-0f42-4cac-a23c-4d7e24fe632c");

  final container = ProviderContainer();

  OneSignal.User.pushSubscription.addObserver((state) {
    final id = state.current.id;
    final isOptedIn = state.current.optedIn;
    Print.info(
      "📢 OneSignal Subscription Changed - ID: $id, OptedIn: $isOptedIn",
    );

    if (id != null && id.isNotEmpty && isOptedIn == true) {
      try {
        final notificationRepo = container.read(notificationRepositoryProvider);
        notificationRepo.toggleNotifications(true);
        Print.info("📢 OneSignal id sent to backend: $id (subscribed)");
      } catch (e) {
        Print.error('Error saving OneSignal id from observer: $e');
      }
    } else if (id != null && isOptedIn != true) {
      Print.info(
        "⚠️ OneSignal ID exists but user is not subscribed. Not saving to backend.",
      );
    }
  });

  final initialId = OneSignal.User.pushSubscription.id;
  final initialOptedIn = OneSignal.User.pushSubscription.optedIn;
  Print.info("📢 Initial OneSignal - ID: $initialId, OptedIn: $initialOptedIn");

  if (initialId != null && initialId.isNotEmpty && initialOptedIn == true) {
    try {
      final notificationRepo = container.read(notificationRepositoryProvider);
      notificationRepo.toggleNotifications(true);
      Print.info(
        '📢 Initial OneSignal id sent to backend: $initialId (subscribed)',
      );
    } catch (e) {
      Print.error('Error sending initial OneSignal id: $e');
    }
  } else if (initialId != null && initialOptedIn != true) {
    try {
      final notificationRepo = container.read(notificationRepositoryProvider);
      notificationRepo.toggleNotifications(false);
    } catch (_) {}
    Print.info(
      '⚠️ Initial OneSignal ID exists but user not subscribed. Waiting for opt-in...',
    );
  }

  final storageService = SecureStorageService();
  final alreadyAsked = await storageService.getNotificationPermissionAsked();
  if (!alreadyAsked) {
    OneSignal.Notifications.requestPermission(true);
    await storageService.saveNotificationPermissionAsked(true);
    Print.info('Notification permission requested (first time)');
  } else {
    Print.info(
      'Notification permission already asked previously - skipping prompt',
    );
  }

  final savedLanguageCode = await storageService.getLanguage();

  if (savedLanguageCode != null) {
    try {
      final locale = AppLocaleUtils.parseLocaleParts(
        languageCode: savedLanguageCode,
      );
      LocaleSettings.setLocale(locale);
    } catch (e) {
      await LocaleSettings.useDeviceLocale();
    }
  } else {
    await LocaleSettings.useDeviceLocale();
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      ),
      home: const SplashView(),
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routes: AppRoutes.getRoutes(),
    );
  }
}
