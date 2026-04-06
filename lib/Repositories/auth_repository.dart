import 'package:chatface/Models/auth_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Services/dio_service.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Provider for AuthRepository

class AuthRepository {
  AuthRepository(this.ref);
  final Ref ref;

  DioService get _dioService => ref.read(AllProviders.dioServiceProvider);
  SecureStorageService get _storageService =>
      ref.read(AllProviders.secureStorageServiceProvider);

  /// Create guest user
  /// POST /api/auth/guest
  Future<AuthResponse> createGuestUser({
    Map<String, dynamic>? deviceInfo,
    CancelToken? cancelToken,
  }) async {
    try {
      final payload = <String, dynamic>{};
      if (deviceInfo != null) {
        payload['device_info'] = deviceInfo;
      }
      final response = await _dioService.postRaw(
        'auth/guest',
        data: payload,
        cancelToken: cancelToken,
      );

      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Save tokens and user info
      if (authResponse.tokens != null) {
        await _storageService.saveTokens(
          accessToken: authResponse.tokens!.accessToken,
          refreshToken: authResponse.tokens!.refreshToken,
        );
      }

      if (authResponse.user != null) {
        await _storageService.saveUserId(authResponse.user!.id);
        await _storageService.saveIsGuest(authResponse.user!.isGuest);
      }
      try {
        await Purchases.logIn(authResponse.user!.id.toString());
        Print.info('RevenueCat: Logged in as user ${authResponse.user!.id}');
      } catch (e) {
        Print.error('RevenueCat login error: $e');
      }
      Print.info('Guest user created successfully');
      return authResponse;
    } catch (e) {
      Print.error('Error creating guest user: $e');
      rethrow;
    }
  }

  /// Google Sign-In
  /// POST /api/auth/google
  Future<AuthResponse> signInWithGoogle({
    required String idToken,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dioService.postRaw(
        'auth/google',
        data: {'idToken': idToken},
        cancelToken: cancelToken,
      );

      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Save tokens and user info
      if (authResponse.tokens != null) {
        await _storageService.saveTokens(
          accessToken: authResponse.tokens!.accessToken,
          refreshToken: authResponse.tokens!.refreshToken,
        );
      }

      if (authResponse.user != null) {
        await _storageService.saveUserId(authResponse.user!.id);
        await _storageService.saveIsGuest(authResponse.user!.isGuest);
      }
      try {
        await Purchases.logIn(authResponse.user!.id.toString());
        Print.info('RevenueCat: Logged in as user ${authResponse.user!.id}');
      } catch (e) {
        Print.error('RevenueCat login error: $e');
      }
      Print.info('Google sign-in successful');
      return authResponse;
    } catch (e) {
      Print.error('Error signing in with Google: $e');
      rethrow;
    }
  }

  /// Apple Sign-In
  /// POST /api/auth/apple
  Future<AuthResponse> signInWithApple({
    required String identityToken,
    Map<String, dynamic>? appleUserInfo,
    CancelToken? cancelToken,
  }) async {
    try {
      final data = {
        'identityToken': identityToken,
        ...?(appleUserInfo == null ? null : {'user': appleUserInfo}),
      };
      final response = await _dioService.postRaw(
        'auth/apple',
        data: data,
        cancelToken: cancelToken,
      );

      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Save tokens and user info
      if (authResponse.tokens != null) {
        await _storageService.saveTokens(
          accessToken: authResponse.tokens!.accessToken,
          refreshToken: authResponse.tokens!.refreshToken,
        );
      }

      if (authResponse.user != null) {
        await _storageService.saveUserId(authResponse.user!.id);
        await _storageService.saveIsGuest(authResponse.user!.isGuest);
      }
      try {
        await Purchases.logIn(authResponse.user!.id.toString());
        Print.info('RevenueCat: Logged in as user ${authResponse.user!.id}');
      } catch (e) {
        Print.error('RevenueCat login error: $e');
      }
      Print.info('Apple sign-in successful');
      return authResponse;
    } catch (e) {
      Print.error('Error signing in with Apple: $e');
      rethrow;
    }
  }

  /// Refresh access token
  /// POST /api/auth/refresh
  Future<AuthResponse> refreshAccessToken({CancelToken? cancelToken}) async {
    try {
      final refreshToken = await _storageService.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        throw Exception('No refresh token available');
      }

      final response = await _dioService.postRaw(
        'auth/refresh',
        data: {'refreshToken': refreshToken},
        cancelToken: cancelToken,
      );

      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Save new tokens
      if (authResponse.tokens != null) {
        await _storageService.saveTokens(
          accessToken: authResponse.tokens!.accessToken,
          refreshToken: authResponse.tokens!.refreshToken,
        );
      }

      Print.info('Token refreshed successfully');
      return authResponse;
    } catch (e) {
      Print.error('Error refreshing token: $e');
      // Clear tokens if refresh failed
      await _storageService.clearTokens();
      rethrow;
    }
  }

  /// Logout user
  /// POST /api/auth/logout
  Future<void> logout({CancelToken? cancelToken}) async {
    try {
      final refreshToken = await _storageService.getRefreshToken();

      await _dioService.postRaw(
        'auth/logout',
        data: {'refreshToken': refreshToken},
        cancelToken: cancelToken,
      );
      await ref.watch(userProfileProvider.notifier).refresh();
      try {
        await Purchases.logOut();
        Print.info('RevenueCat: Logged out successfully');
      } catch (e) {
        Print.error('RevenueCat logout error: $e');
      }
      // Clear local storage
      await _storageService.clearAll();

      Print.info('Logout successful');
    } catch (e) {
      Print.error('Error logging out: $e');
      // Clear local storage even if API call fails
      await _storageService.clearAll();
      rethrow;
    }
  }

  /// Get current user info
  /// GET /api/auth/me
  Future<AuthResponse> getCurrentUser({CancelToken? cancelToken}) async {
    try {
      final response = await _dioService.get(
        'auth/me',
        cancelToken: cancelToken,
      );

      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Update user info in storage
      if (authResponse.user != null) {
        await _storageService.saveUserId(authResponse.user!.id);
        await _storageService.saveIsGuest(authResponse.user!.isGuest);
      }

      Print.info('Current user info retrieved');
      return authResponse;
    } catch (e) {
      Print.error('Error getting current user: $e');
      rethrow;
    }
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    return await _storageService.isLoggedIn();
  }

  /// Get stored access token
  Future<String?> getAccessToken() async {
    return await _storageService.getAccessToken();
  }

  /// Get stored refresh token
  Future<String?> getRefreshToken() async {
    return await _storageService.getRefreshToken();
  }
}
