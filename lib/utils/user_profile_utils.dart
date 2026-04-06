import 'dart:convert';

import 'package:chatface/Views/EditProfileView/widgets/select_country.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/cdn_link_handler.dart';
import 'package:flutter/widgets.dart';

List<String> normalizeUserProfilePictureUrls(dynamic value) {
  if (value == null) return const [];

  if (value is List) {
    return value
        .map((item) => item?.toString().trim() ?? '')
        .where((url) => url.isNotEmpty)
        .toList(growable: false);
  }

  if (value is String) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return const [];

    try {
      final parsed = jsonDecode(trimmed);
      final normalized = normalizeUserProfilePictureUrls(parsed);
      if (normalized.isNotEmpty) {
        return normalized;
      }
    } catch (_) {}

    if (trimmed.contains(',')) {
      return trimmed
          .split(',')
          .map((url) => url.trim())
          .where((url) => url.isNotEmpty)
          .toList(growable: false);
    }

    return [trimmed];
  }

  if (value is Iterable) {
    return value
        .map((item) => item?.toString().trim() ?? '')
        .where((url) => url.isNotEmpty)
        .toList(growable: false);
  }

  return const [];
}

String? resolveUserProfileImageUrl(String? rawUrl) {
  final trimmed = rawUrl?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;

  final uri = Uri.tryParse(trimmed);
  if (uri != null && uri.hasScheme) {
    return trimmed;
  }

  final normalizedPath = trimmed.startsWith('/')
      ? trimmed.substring(1)
      : trimmed;
  if (normalizedPath.isEmpty) return null;

  return '${UrlType.profilePicture.baseUrl}$normalizedPath';
}

String? firstResolvedUserProfileImage(dynamic value) {
  final urls = normalizeUserProfilePictureUrls(value);
  if (urls.isEmpty) return null;

  for (final url in urls) {
    final resolved = resolveUserProfileImageUrl(url);
    if (resolved != null && resolved.isNotEmpty) {
      return resolved;
    }
  }

  return null;
}

String userGenderLabel(BuildContext context, String? gender) {
  switch (gender?.trim().toLowerCase()) {
    case 'male':
      return context.t.editProfile.male;
    case 'female':
      return context.t.editProfile.female;
    case 'dont_say':
    case 'other':
    default:
      return context.t.editProfile.dontWantToMention;
  }
}

String userCountryLabel(BuildContext context, String? countryCode) {
  final normalized = countryCode?.trim().toUpperCase();
  if (normalized == null || normalized.isEmpty) {
    return context.t.editProfile.country;
  }

  final countries = SelectCountry.allCountries;
  final match = countries.where((country) => country.countryCode == normalized);
  if (match.isEmpty) return normalized;

  final country = match.first;
  return country.getTranslatedName(context) ?? country.name;
}

String userCountryFlag(String? countryCode) {
  final normalized = countryCode?.trim().toUpperCase();
  if (normalized == null || normalized.isEmpty) return '🌍';

  final countries = SelectCountry.allCountries;
  final match = countries.where((country) => country.countryCode == normalized);
  if (match.isEmpty) return '🌍';

  return match.first.flagEmoji;
}
