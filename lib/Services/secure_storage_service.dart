import 'package:chatface/utils/print.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _isGuestKey = 'is_guest';
  static const String _languageKey = 'app_language';
  // OneSignal / notification keys
  static const String _oneSignalPlayerIdKey = 'onesignal_player_id';
  static const String _pendingOneSignalPlayerIdKey =
      'pending_onesignal_player_id';
  static const String _pendingNotificationPrefKey = 'pending_notification_pref';
  static const String _notificationPermissionAskedKey =
      'notification_permission_asked';

  // Pending auth credentials (used during onboarding)
  static const String _pendingAuthMethodKey = 'pending_auth_method';
  static const String _pendingGoogleIdTokenKey = 'pending_google_id_token';
  static const String _pendingFacebookTokenKey = 'pending_facebook_token';
  static const String _pendingAppleIdTokenKey = 'pending_apple_id_token';
  static const String _pendingAppleUserInfoKey = 'pending_apple_user_info';

  static const String _activePersonaIdKey = 'active_persona_id';
  static const String _activeSessionIdKey = 'active_session_id';
  static const String _wsResumeTokenKey = 'ws_resume_token';
  static const String _selectedGenderKey = 'selected_character_gender';
  static const String _selectedLanguageKey = 'selected_character_language';

  // Flutter Secure Storage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// Save access token
  Future<void> saveAccessToken(String token) async {
    try {
      await _storage.write(key: _accessTokenKey, value: token);
      Print.info('Access token saved securely');
    } catch (e) {
      Print.error('Error saving access token: $e');
      rethrow;
    }
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey);
    } catch (e) {
      Print.error('Error getting access token: $e');
      return null;
    }
  }

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: token);
      Print.info('Refresh token saved securely');
    } catch (e) {
      Print.error('Error saving refresh token: $e');
      rethrow;
    }
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      Print.error('Error getting refresh token: $e');
      return null;
    }
  }

  /// Save tokens (both access and refresh)
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await saveAccessToken(accessToken);
    await saveRefreshToken(refreshToken);
  }

  /// Save user ID
  Future<void> saveUserId(int userId) async {
    try {
      await _storage.write(key: _userIdKey, value: userId.toString());
      Print.info('User ID saved securely');
    } catch (e) {
      Print.error('Error saving user ID: $e');
      rethrow;
    }
  }

  /// Get user ID
  Future<int?> getUserId() async {
    try {
      final value = await _storage.read(key: _userIdKey);
      return value != null ? int.tryParse(value) : null;
    } catch (e) {
      Print.error('Error getting user ID: $e');
      return null;
    }
  }

  /// Save guest status
  Future<void> saveIsGuest(bool isGuest) async {
    try {
      await _storage.write(key: _isGuestKey, value: isGuest.toString());
      Print.info('Guest status saved securely: $isGuest');
    } catch (e) {
      Print.error('Error saving guest status: $e');
      rethrow;
    }
  }

  /// Get guest status
  Future<bool> getIsGuest() async {
    try {
      final value = await _storage.read(key: _isGuestKey);
      return value == 'true';
    } catch (e) {
      Print.error('Error getting guest status: $e');
      return false;
    }
  }

  /// Save app language
  Future<void> saveAppLanguage(String languageCode) async {
    try {
      await _storage.write(key: _languageKey, value: languageCode);
      Print.info('App language saved: $languageCode');
    } catch (e) {
      Print.error('Error saving app language: $e');
      rethrow;
    }
  }

  /// Get app language
  Future<String?> getAppLanguage() async {
    try {
      return await _storage.read(key: _languageKey);
    } catch (e) {
      Print.error('Error getting app language: $e');
      return null;
    }
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  Future<void> saveActivePersonaId(String personaId) =>
      _storage.write(key: _activePersonaIdKey, value: personaId);

  Future<String?> getActivePersonaId() =>
      _storage.read(key: _activePersonaIdKey);

  Future<void> clearActivePersona() async {
    await _storage.delete(key: _activePersonaIdKey);
    await _storage.delete(key: _activeSessionIdKey);
    await _storage.delete(key: _wsResumeTokenKey);
  }

  Future<void> saveActiveSessionId(String sessionId) =>
      _storage.write(key: _activeSessionIdKey, value: sessionId);

  Future<String?> getActiveSessionId() =>
      _storage.read(key: _activeSessionIdKey);

  Future<void> saveWebSocketResumeToken(String token) =>
      _storage.write(key: _wsResumeTokenKey, value: token);

  Future<String?> getWebSocketResumeToken() =>
      _storage.read(key: _wsResumeTokenKey);

  Future<void> saveCharacterFilters({String? gender, String? language}) async {
    if (gender != null) {
      await _storage.write(key: _selectedGenderKey, value: gender);
    } else {
      await _storage.delete(key: _selectedGenderKey);
    }
    if (language != null) {
      await _storage.write(key: _selectedLanguageKey, value: language);
    } else {
      await _storage.delete(key: _selectedLanguageKey);
    }
  }

  Future<String?> getSelectedCharacterGender() =>
      _storage.read(key: _selectedGenderKey);

  Future<String?> getSelectedCharacterLanguage() =>
      _storage.read(key: _selectedLanguageKey);

  /// Clear all stored data
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      Print.info('All secure storage cleared');
    } catch (e) {
      Print.error('Error clearing storage: $e');
      rethrow;
    }
  }

  /// Clear auth tokens only
  Future<void> clearTokens() async {
    try {
      await _storage.delete(key: _accessTokenKey);
      await _storage.delete(key: _refreshTokenKey);
      Print.info('Tokens cleared from secure storage');
    } catch (e) {
      Print.error('Error clearing tokens: $e');
      rethrow;
    }
  }

  /// Get all keys (for debugging - use carefully)
  Future<Map<String, String>> getAllData() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      Print.error('Error reading all data: $e');
      return {};
    }
  }

  // ==================== Pending Auth Credentials Methods ====================

  /// Save pending auth method
  Future<void> savePendingAuthMethod(String method) async {
    try {
      await _storage.write(key: _pendingAuthMethodKey, value: method);
      Print.info('Pending auth method saved: $method');
    } catch (e) {
      Print.error('Error saving pending auth method: $e');
      rethrow;
    }
  }

  /// Get pending auth method
  Future<String?> getPendingAuthMethod() async {
    try {
      return await _storage.read(key: _pendingAuthMethodKey);
    } catch (e) {
      Print.error('Error getting pending auth method: $e');
      return null;
    }
  }

  /// Save pending Google ID token
  Future<void> savePendingGoogleIdToken(String idToken) async {
    try {
      await _storage.write(key: _pendingGoogleIdTokenKey, value: idToken);
      Print.info('Pending Google ID token saved');
    } catch (e) {
      Print.error('Error saving pending Google ID token: $e');
      rethrow;
    }
  }

  /// Get pending Google ID token
  Future<String?> getPendingGoogleIdToken() async {
    try {
      return await _storage.read(key: _pendingGoogleIdTokenKey);
    } catch (e) {
      Print.error('Error getting pending Google ID token: $e');
      return null;
    }
  }

  /// Save pending Facebook access token
  Future<void> savePendingFacebookToken(String accessToken) async {
    try {
      await _storage.write(key: _pendingFacebookTokenKey, value: accessToken);
      Print.info('Pending Facebook token saved');
    } catch (e) {
      Print.error('Error saving pending Facebook token: $e');
      rethrow;
    }
  }

  /// Get pending Facebook access token
  Future<String?> getPendingFacebookToken() async {
    try {
      return await _storage.read(key: _pendingFacebookTokenKey);
    } catch (e) {
      Print.error('Error getting pending Facebook token: $e');
      return null;
    }
  }

  /// Save pending Apple identity token
  Future<void> savePendingAppleIdToken(String identityToken) async {
    try {
      await _storage.write(key: _pendingAppleIdTokenKey, value: identityToken);
      Print.info('Pending Apple ID token saved');
    } catch (e) {
      Print.error('Error saving pending Apple ID token: $e');
      rethrow;
    }
  }

  /// Get pending Apple identity token
  Future<String?> getPendingAppleIdToken() async {
    try {
      return await _storage.read(key: _pendingAppleIdTokenKey);
    } catch (e) {
      Print.error('Error getting pending Apple ID token: $e');
      return null;
    }
  }

  /// Save pending Apple user info (JSON string)
  Future<void> savePendingAppleUserInfo(String userInfoJson) async {
    try {
      await _storage.write(key: _pendingAppleUserInfoKey, value: userInfoJson);
      Print.info('Pending Apple user info saved');
    } catch (e) {
      Print.error('Error saving pending Apple user info: $e');
      rethrow;
    }
  }

  /// Get pending Apple user info (JSON string)
  Future<String?> getPendingAppleUserInfo() async {
    try {
      return await _storage.read(key: _pendingAppleUserInfoKey);
    } catch (e) {
      Print.error('Error getting pending Apple user info: $e');
      return null;
    }
  }

  /// Clear all pending auth credentials
  Future<void> clearPendingAuthCredentials() async {
    try {
      await _storage.delete(key: _pendingAuthMethodKey);
      await _storage.delete(key: _pendingGoogleIdTokenKey);
      await _storage.delete(key: _pendingFacebookTokenKey);
      await _storage.delete(key: _pendingAppleIdTokenKey);
      await _storage.delete(key: _pendingAppleUserInfoKey);
      Print.info('Pending auth credentials cleared');
    } catch (e) {
      Print.error('Error clearing pending auth credentials: $e');
      rethrow;
    }
  }

  /// Check if a key exists
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      Print.error('Error checking key existence: $e');
      return false;
    }
  }

  Future<void> saveLanguage(String languageCode) async {
    try {
      await _storage.write(key: _languageKey, value: languageCode);
      Print.info('Language saved securely: $languageCode');
    } catch (e) {
      Print.error('Error saving language: $e');
      rethrow;
    }
  }

  /// Get saved app language
  Future<String?> getLanguage() async {
    try {
      return await _storage.read(key: _languageKey);
    } catch (e) {
      Print.error('Error getting language: $e');
      return null;
    }
  }

  // ==================== OneSignal / Notification helpers ====================

  Future<void> saveOneSignalPlayerId(String playerId) async {
    try {
      await _storage.write(key: _oneSignalPlayerIdKey, value: playerId);
      Print.info('OneSignal player id saved locally');
    } catch (e) {
      Print.error('Error saving OneSignal player id locally: $e');
      rethrow;
    }
  }

  Future<String?> getOneSignalPlayerId() async {
    try {
      return await _storage.read(key: _oneSignalPlayerIdKey);
    } catch (e) {
      Print.error('Error getting OneSignal player id: $e');
      return null;
    }
  }

  Future<void> clearOneSignalPlayerId() async {
    try {
      await _storage.delete(key: _oneSignalPlayerIdKey);
      Print.info('OneSignal player id cleared from local storage');
    } catch (e) {
      Print.error('Error clearing OneSignal player id: $e');
      rethrow;
    }
  }

  Future<void> savePendingOneSignalId(String playerId) async {
    try {
      await _storage.write(key: _pendingOneSignalPlayerIdKey, value: playerId);
      Print.info('Pending OneSignal player id saved: $playerId');
    } catch (e) {
      Print.error('Error saving pending OneSignal id: $e');
      rethrow;
    }
  }

  Future<String?> getPendingOneSignalId() async {
    try {
      return await _storage.read(key: _pendingOneSignalPlayerIdKey);
    } catch (e) {
      Print.error('Error getting pending OneSignal id: $e');
      return null;
    }
  }

  Future<void> clearPendingOneSignalId() async {
    try {
      await _storage.delete(key: _pendingOneSignalPlayerIdKey);
      Print.info('Pending OneSignal id cleared');
    } catch (e) {
      Print.error('Error clearing pending OneSignal id: $e');
      rethrow;
    }
  }

  Future<void> savePendingNotificationPref(bool enabled) async {
    try {
      await _storage.write(
        key: _pendingNotificationPrefKey,
        value: enabled ? '1' : '0',
      );
      Print.info('Pending notification pref saved: $enabled');
    } catch (e) {
      Print.error('Error saving pending notification pref: $e');
      rethrow;
    }
  }

  Future<bool?> getPendingNotificationPref() async {
    try {
      final v = await _storage.read(key: _pendingNotificationPrefKey);
      if (v == null) return null;
      return v == '1';
    } catch (e) {
      Print.error('Error reading pending notification pref: $e');
      return null;
    }
  }

  Future<void> clearPendingNotificationPref() async {
    try {
      await _storage.delete(key: _pendingNotificationPrefKey);
      Print.info('Pending notification pref cleared');
    } catch (e) {
      Print.error('Error clearing pending notification pref: $e');
      rethrow;
    }
  }

  /// Save whether we've already asked the user for system notification permission
  Future<void> saveNotificationPermissionAsked(bool asked) async {
    try {
      await _storage.write(
        key: _notificationPermissionAskedKey,
        value: asked ? '1' : '0',
      );
      Print.info('Notification permission asked flag saved: $asked');
    } catch (e) {
      Print.error('Error saving notification permission asked flag: $e');
      rethrow;
    }
  }

  /// Get whether we've already asked the user for notification permission
  Future<bool> getNotificationPermissionAsked() async {
    try {
      final v = await _storage.read(key: _notificationPermissionAskedKey);
      if (v == null) return false;
      return v == '1';
    } catch (e) {
      Print.error('Error reading notification permission asked flag: $e');
      return false;
    }
  }

  Future<void> clearNotificationPermissionAsked() async {
    try {
      await _storage.delete(key: _notificationPermissionAskedKey);
      Print.info('Notification permission asked flag cleared');
    } catch (e) {
      Print.error('Error clearing notification permission asked flag: $e');
      rethrow;
    }
  }
}
