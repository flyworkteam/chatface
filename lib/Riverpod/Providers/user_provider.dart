import 'dart:io';

import 'package:chatface/Models/user_model.dart';
import 'package:chatface/Repositories/user_repository.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ============================================
// Repository Provider
// ============================================

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

// ============================================
// User Profile Provider
// ============================================

class UserNotifier extends AsyncNotifier<UserProfileData?> {
  UserRepository get _repository => ref.read(userRepositoryProvider);

  @override
  Future<UserProfileData?> build() async {
    return _fetchProfile();
  }

  Future<UserProfileData?> _fetchProfile() async {
    try {
      final response = await _repository.getUserProfile();
      if (response.success && response.data != null) {
        return response.data;
      }
      return null;
    } catch (e) {
      Print.error('Error loading user profile: $e');
      return null;
    }
  }

  /// Refresh the profile from backend
  Future<UserProfileData?> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProfile());
    return state.asData?.value;
  }

  /// Update profile fields
  Future<bool> updateProfile({
    String? fullName,
    String? aboutMe,
    List<String>? profilePictureUrls,
    String? preferredLanguage,
    String? gender,
    String? country,
  }) async {
    try {
      final success = await _repository.updateUserProfile(
        fullName: fullName,
        profilePictureUrls: profilePictureUrls,
        preferredLanguage: preferredLanguage,
        aboutMe: aboutMe,
        gender: gender,
        country: country,
      );
      if (success) {
        await refresh();
      }
      return success;
    } catch (e) {
      Print.error('Error updating profile: $e');
      return false;
    }
  }

  /// Upload profile photo
  Future<String?> uploadPhoto(List<File> photos) async {
    try {
      final url = await _repository.uploadProfilePhoto(photos: photos);
      Print.info('Photo uploaded successfully: $url');

      await refresh();

      return url;
    } catch (e) {
      Print.error('Error uploading photo: $e');
      return null;
    }
  }

  /// Log user daily activity
  Future<bool> logActivity() async {
    try {
      final success = await _repository.logActivity();
      if (success) {
        await refresh();
      }
      return success;
    } catch (e) {
      Print.error('Error logging activity: $e');
      return false;
    }
  }

  /// Delete user account
  Future<bool> deleteAccount() async {
    try {
      final success = await _repository.deleteAccount();
      if (success) {
        state = const AsyncValue.data(null);
      }
      return success;
    } catch (e) {
      Print.error('Error deleting account: $e');
      return false;
    }
  }
}

final userProfileProvider =
    AsyncNotifierProvider<UserNotifier, UserProfileData?>(() => UserNotifier());
