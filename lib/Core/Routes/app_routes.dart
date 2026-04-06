import 'package:chatface/Views/Auth/LoginView/login_view.dart';
import 'package:chatface/Views/CallView/call_view.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_view.dart';
import 'package:chatface/Views/CharactersView/characters_view.dart';
import 'package:chatface/Views/EditProfileView/edit_profile_view.dart';
import 'package:chatface/Views/HomeView/home_view.dart';
import 'package:chatface/Views/MainView/main_view.dart';
import 'package:chatface/Views/NotificationsView/notifications_view.dart';
import 'package:chatface/Views/OnboardingView/onboarding_view.dart';
import 'package:chatface/Views/SettingsSupportView/settings_support_view.dart';
import 'package:chatface/Views/SplashView/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String main = '/main';
  static const String home = '/home';
  static const String editProfile = '/edit-profile';
  static const String settingsSupport = '/settings-support';
  static const String notifications = '/notifications';
  static const String characters = '/characters';
  static const String characterDetail = '/character-detail';
  static const String call = '/call';
  static const String chat = '/chat';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashView(),
      login: (context) => LoginView(),
      onboarding: (context) => const OnboardingView(),
      main: (context) => const MainView(),
      home: (context) => const HomeView(),
      characters: (context) => const CharactersView(),
      characterDetail: (context) => const CharacterDetailView(),
      editProfile: (context) => const EditProfileView(),
      settingsSupport: (context) => const SettingsSupportView(),
      call: (context) => const CallView(),
      notifications: (context) => const NotificationsView(),
    };
  }
}
