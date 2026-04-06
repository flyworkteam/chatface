import 'package:chatface/utils/user_profile_utils.dart';

/// User Profile Response from GET /api/user/profile
class UserProfileResponse {
  final bool success;
  final UserProfileData? data;

  UserProfileResponse({required this.success, this.data});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] != null
          ? UserProfileData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UserProfileData {
  final UserProfile user;
  final UserProfileDetail? profile;
  final StreakData? streak;

  UserProfileData({required this.user, this.profile, this.streak});

  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      profile: json['profile'] != null
          ? UserProfileDetail.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
      streak: json['streak'] != null
          ? StreakData.fromJson(json['streak'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UserProfile {
  final int id;
  final String? email;
  final String? fullName;
  final int? age;
  final String? aboutMe;
  final String? authProvider;
  final String? providerId;
  final bool isGuest;
  final bool isActive;
  final bool isPremium;
  final bool onboardingCompleted;
  final String preferredLanguage;
  final String? gender;
  final String? country;
  final List<String> profilePictureUrls;
  final String? profilePictureUrl;
  final String? invitationCode;
  final String? usedReferralCode;
  final int referralCount;
  final DateTime? premiumEndtime;
  final DateTime? lastLoginAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserProfile({
    required this.id,
    this.email,
    this.fullName,
    this.age,
    this.aboutMe,
    this.authProvider,
    this.providerId,
    required this.isGuest,
    required this.isActive,
    required this.isPremium,
    required this.onboardingCompleted,
    this.preferredLanguage = 'en',
    this.gender,
    this.country,
    this.profilePictureUrls = const [],
    this.profilePictureUrl,
    this.invitationCode,
    this.usedReferralCode,
    this.referralCount = 0,
    this.premiumEndtime,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String?,
      fullName: json['fullName'] as String? ?? json['full_name'] as String?,
      age: _parseInt(json['age']),
      aboutMe: json['aboutMe'] as String? ?? json['about_me'] as String?,
      authProvider:
          json['authProvider'] as String? ?? json['auth_provider'] as String?,
      providerId:
          json['providerId'] as String? ?? json['provider_id'] as String?,
      isGuest: _parseBool(json['isGuest'] ?? json['is_guest']),
      isActive: _parseBool(json['isActive'] ?? json['is_active']),
      isPremium: _parseBool(json['isPremium'] ?? json['is_premium']),
      onboardingCompleted: _parseBool(
        json['onboardingCompleted'] ?? json['onboarding_completed'],
      ),
      preferredLanguage:
          json['preferredLanguage'] as String? ??
          json['preferred_language'] as String? ??
          'en',
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      profilePictureUrls: normalizeUserProfilePictureUrls(
        json['profilePictureUrls'] ?? json['profile_picture_urls'],
      ),
      profilePictureUrl: firstResolvedUserProfileImage(
        json['profilePictureUrls'] ??
            json['profile_picture_urls'] ??
            json['profilePictureUrl'] ??
            json['profile_picture_url'],
      ),
      invitationCode:
          json['invitationCode'] as String? ??
          json['invitation_code'] as String?,
      usedReferralCode:
          json['usedReferralCode'] as String? ??
          json['used_referral_code'] as String?,
      referralCount:
          _parseInt(json['referralCount'] ?? json['referral_count']) ?? 0,
      premiumEndtime: _parseDate(
        json['premiumEndtime'] ?? json['premium_endtime'],
      ),
      lastLoginAt: _parseDate(json['lastLoginAt'] ?? json['last_login_at']),
      createdAt: _parseDate(json['createdAt'] ?? json['created_at']),
      updatedAt: _parseDate(json['updatedAt'] ?? json['updated_at']),
    );
  }

  UserProfile copyWith({
    int? id,
    String? email,
    String? fullName,
    int? age,
    String? aboutMe,
    String? authProvider,
    String? providerId,
    bool? isGuest,
    bool? isActive,
    bool? isPremium,
    bool? onboardingCompleted,
    String? preferredLanguage,
    String? gender,
    String? country,
    List<String>? profilePictureUrls,
    String? profilePictureUrl,
    String? invitationCode,
    String? usedReferralCode,
    int? referralCount,
    DateTime? premiumEndtime,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      aboutMe: aboutMe ?? this.aboutMe,
      authProvider: authProvider ?? this.authProvider,
      providerId: providerId ?? this.providerId,
      isGuest: isGuest ?? this.isGuest,
      isActive: isActive ?? this.isActive,
      isPremium: isPremium ?? this.isPremium,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      profilePictureUrls: profilePictureUrls ?? this.profilePictureUrls,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      invitationCode: invitationCode ?? this.invitationCode,
      usedReferralCode: usedReferralCode ?? this.usedReferralCode,
      referralCount: referralCount ?? this.referralCount,
      premiumEndtime: premiumEndtime ?? this.premiumEndtime,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) return value;
    if (value is int) return value == 1;
    return false;
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class UserProfileDetail {
  final List<String> preferredCategories;

  UserProfileDetail({required this.preferredCategories});

  factory UserProfileDetail.fromJson(Map<String, dynamic> json) {
    final categories = json['preferredCategories'] as List?;
    return UserProfileDetail(
      preferredCategories: categories != null
          ? categories.map((e) => e.toString()).toList()
          : [],
    );
  }
}

class StreakData {
  final int currentStreak;
  final List<bool> weekActivity;

  StreakData({required this.currentStreak, required this.weekActivity});

  factory StreakData.fromJson(Map<String, dynamic> json) {
    final activity = json['weekActivity'] as List?;
    return StreakData(
      currentStreak: json['currentStreak'] as int? ?? 0,
      weekActivity: activity != null
          ? activity.map((e) => e as bool? ?? false).toList()
          : List.filled(7, false),
    );
  }
}
