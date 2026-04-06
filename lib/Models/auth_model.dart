import 'package:chatface/utils/print.dart';
import 'package:chatface/utils/user_profile_utils.dart';

class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final String expiresIn;

  AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      expiresIn: json['expiresIn'] as String? ?? '7d',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }
}

class AuthUser {
  final int id;
  final String? email;
  final String? fullName;
  final List<String> profilePictureUrls;
  final String? profilePictureUrl;
  final String? invitationCode;
  final String authProvider;
  final bool isGuest;
  final bool onboardingCompleted;
  final String? preferredLanguage;
  final DateTime? createdAt;

  AuthUser({
    required this.id,
    this.email,
    this.fullName,
    this.profilePictureUrls = const [],
    this.profilePictureUrl,
    this.invitationCode,
    required this.authProvider,
    required this.isGuest,
    required this.onboardingCompleted,
    this.preferredLanguage,
    this.createdAt,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    Print.info('AuthUser.fromJson: $json');
    return AuthUser(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String?,
      fullName: json['fullName'] as String? ?? json['full_name'] as String?,
      profilePictureUrls: normalizeUserProfilePictureUrls(
        json['profilePictureUrls'] ??
            json['profile_picture_urls'] ??
            json['profilePictureUrl'] ??
            json['profile_picture_url'],
      ),
      profilePictureUrl: firstResolvedUserProfileImage(
        json['profilePictureUrls'] ??
            json['profile_picture_urls'] ??
            json['profilePictureUrl'] ??
            json['profile_picture_url'],
      ),
      authProvider:
          json['authProvider'] as String? ??
          json['auth_provider'] as String? ??
          'guest',
      isGuest: (json['isGuest'] ?? json['is_guest']) is int
          ? (json['isGuest'] ?? json['is_guest']) == 1
          : json['isGuest'] as bool? ?? json['is_guest'] as bool? ?? false,
      onboardingCompleted:
          (json['onboardingCompleted'] ?? json['onboarding_completed']) is int
          ? (json['onboardingCompleted'] ?? json['onboarding_completed']) == 1
          : json['onboardingCompleted'] as bool? ??
                json['onboarding_completed'] as bool? ??
                false,
      preferredLanguage:
          json['preferredLanguage'] as String? ??
          json['preferred_language'] as String?,
      invitationCode:
          json['invitationCode'] as String? ??
          json['invitation_code'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'profilePictureUrls': profilePictureUrls,
      'profilePictureUrl': profilePictureUrl,
      'authProvider': authProvider,
      'isGuest': isGuest,
      'onboardingCompleted': onboardingCompleted,
      'preferredLanguage': preferredLanguage,
      'invitationCode': invitationCode,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  AuthUser copyWith({
    int? id,
    String? email,
    String? fullName,
    List<String>? profilePictureUrls,
    String? profilePictureUrl,
    String? authProvider,
    bool? isGuest,
    bool? onboardingCompleted,
    String? preferredLanguage,
    String? invitationCode,
    DateTime? createdAt,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      profilePictureUrls: profilePictureUrls ?? this.profilePictureUrls,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      authProvider: authProvider ?? this.authProvider,
      isGuest: isGuest ?? this.isGuest,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      invitationCode: invitationCode ?? this.invitationCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'AuthUser(id: $id, invitationCode: $invitationCode, preferredLanguage: $preferredLanguage)';
  }
}

class UserProfile {
  final String? gender;
  final int? age;

  UserProfile({this.gender, this.age});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      gender: json['gender'] as String?,
      age: json['age'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'gender': gender, 'age': age};
  }
}

class AuthResponse {
  final bool success;
  final String message;
  final AuthUser? user;
  final AuthTokens? tokens;
  final bool? isNewUser;
  final UserProfile? profile;

  AuthResponse({
    required this.success,
    required this.message,
    this.user,
    this.tokens,
    this.isNewUser,
    this.profile,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;

    return AuthResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      user: data?['user'] != null
          ? AuthUser.fromJson(data!['user'] as Map<String, dynamic>)
          : null,
      tokens: data?['tokens'] != null
          ? AuthTokens.fromJson(data!['tokens'] as Map<String, dynamic>)
          : null,
      isNewUser: data?['isNewUser'] as bool?,
      profile: data?['profile'] != null
          ? UserProfile.fromJson(data!['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': {
        'user': user?.toJson(),
        'tokens': tokens?.toJson(),
        'isNewUser': isNewUser,
        'profile': profile?.toJson(),
      },
    };
  }
}
