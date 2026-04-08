import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/cdn_link_handler.dart';

class PersonaVoice {
  const PersonaVoice({
    required this.languageCode,
    required this.voiceId,
    this.stability,
    this.style,
    this.timbre,
    this.lipSyncPreset,
    this.sampleRate,
  });

  final String languageCode;
  final String voiceId;
  final double? stability;
  final double? style;
  final String? timbre;
  final String? lipSyncPreset;
  final int? sampleRate;

  factory PersonaVoice.fromJson(Map<String, dynamic> json) {
    final data = _JsonReader(json);
    return PersonaVoice(
      languageCode: data.stringAny([
        'languageCode',
        'language_code',
      ], fallback: 'en'),
      voiceId: data.stringAny(['voiceId', 'elevenlabs_voice_id']),
      stability: data.doubleAny(['stability']),
      style: data.doubleValue('style'),
      timbre: data.optionalString('timbre'),
      lipSyncPreset: data.optionalStringAny([
        'lipSyncPreset',
        'lip_sync_preset',
      ]),
      sampleRate: data.intAny(['sampleRate', 'sample_rate']),
    );
  }
}

class PersonaProfile {
  const PersonaProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.shortDescription,
    required this.jobTitle,
    required this.defaultLanguage,
    required this.promptTemplate,
    this.isFollowed = false,
    this.gender,
    this.selectedLanguage,
    this.avatarUrl,
    this.riveAssetUrl,
    this.isActive = true,
    this.voices = const [],
    this.availableLanguageCodes = const [],
  });

  final String id;
  final String name;
  final int age;
  final String description;
  final String shortDescription;
  final String jobTitle;
  final String defaultLanguage;
  final String promptTemplate;
  final bool isFollowed;
  final String? gender;
  final String? selectedLanguage;
  final String? avatarUrl;
  final String? riveAssetUrl;
  final bool isActive;
  final List<PersonaVoice> voices;
  final List<String> availableLanguageCodes;

  static const _sentinel = Object();

  factory PersonaProfile.fromJson(Map<String, dynamic> json) {
    final data = _JsonReader(json);
    final rawVoices = json['voices'] as List<dynamic>? ?? const [];
    final rawAvailableLanguages =
        json['availableLanguageCodes'] as List<dynamic>? ??
        json['available_language_codes'] as List<dynamic>? ??
        const [];
    final voices = rawVoices
        .map(_JsonReader.asMap)
        .whereType<Map<String, dynamic>>()
        .map(PersonaVoice.fromJson)
        .toList();
    final availableLanguageCodes = rawAvailableLanguages
        .map((entry) => entry?.toString().trim().toLowerCase() ?? '')
        .where((entry) => entry.isNotEmpty)
        .toSet()
        .toList();
    for (final voice in voices) {
      final code = voice.languageCode.trim().toLowerCase();
      if (code.isNotEmpty && !availableLanguageCodes.contains(code)) {
        availableLanguageCodes.add(code);
      }
    }

    return PersonaProfile(
      id: data.string('id'),
      name: data.string('name', fallback: 'Companion'),
      age: data.intValue('age') ?? 0,
      description: data.string('description'),
      shortDescription: data.string('short_description', fallback: ''),
      jobTitle: data.string('job_title', fallback: ''),
      defaultLanguage: data.stringAny([
        'defaultLanguage',
        'default_language',
      ], fallback: 'en'),
      promptTemplate: data.stringAny(['promptTemplate', 'prompt_template']),
      isFollowed: data.boolAny(['isFollowed', 'is_followed'], fallback: false),
      gender: data.optionalString('gender'),
      selectedLanguage: data.optionalStringAny([
        'selectedLanguage',
        'selected_language',
      ]),
      avatarUrl: data.optionalStringAny(['avatarUrl', 'avatar_key']),
      riveAssetUrl: data.optionalStringAny(['riveAssetUrl', 'rive_asset']),
      isActive: data.boolValue('active', fallback: true),
      voices: voices,
      availableLanguageCodes: availableLanguageCodes,
    );
  }

  factory PersonaProfile.fallback({
    required String id,
    required String name,
    int age = 18,

    String description = '',
    String shortDescription = '',
    String jobTitle = '',
    String defaultLanguage = 'en',
    String promptTemplate = '',
    bool isFollowed = false,
    String? gender,
    String? selectedLanguage,
    String? avatarUrl,
    String? riveAssetUrl,
    bool isActive = true,
    List<PersonaVoice> voices = const [],
    List<String> availableLanguageCodes = const [],
  }) {
    return PersonaProfile(
      id: id,
      name: name,
      age: age,
      description: description,
      shortDescription: shortDescription,
      jobTitle: jobTitle,
      defaultLanguage: defaultLanguage,
      promptTemplate: promptTemplate,
      isFollowed: isFollowed,
      gender: gender,
      selectedLanguage: selectedLanguage,
      avatarUrl: avatarUrl,
      riveAssetUrl: riveAssetUrl,
      isActive: isActive,
      voices: voices,
      availableLanguageCodes: availableLanguageCodes,
    );
  }

  PersonaProfile copyWith({
    String? id,
    String? name,
    int? age,
    String? description,
    String? jobTitle,
    String? shortDescription,
    String? defaultLanguage,
    String? promptTemplate,
    bool? isFollowed,
    Object? gender = _sentinel,
    Object? selectedLanguage = _sentinel,
    Object? avatarUrl = _sentinel,
    Object? riveAssetUrl = _sentinel,
    bool? isActive,
    List<PersonaVoice>? voices,
    List<String>? availableLanguageCodes,
  }) {
    return PersonaProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      jobTitle: jobTitle ?? this.jobTitle,
      promptTemplate: promptTemplate ?? this.promptTemplate,
      isFollowed: isFollowed ?? this.isFollowed,
      gender: identical(gender, _sentinel) ? this.gender : gender as String?,
      selectedLanguage: identical(selectedLanguage, _sentinel)
          ? this.selectedLanguage
          : selectedLanguage as String?,
      avatarUrl: identical(avatarUrl, _sentinel)
          ? this.avatarUrl
          : avatarUrl as String?,
      riveAssetUrl: identical(riveAssetUrl, _sentinel)
          ? this.riveAssetUrl
          : riveAssetUrl as String?,
      isActive: isActive ?? this.isActive,
      voices: voices ?? this.voices,
      availableLanguageCodes:
          availableLanguageCodes ?? this.availableLanguageCodes,
    );
  }

  PersonaVoice? voiceForLanguage(String language) {
    final normalized = language.toLowerCase();
    for (final voice in voices) {
      if (voice.languageCode.toLowerCase() == normalized) {
        return voice;
      }
    }
    return voices.isEmpty ? null : voices.first;
  }

  bool supportsLanguage(String? language) {
    final normalized = language?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return true;
    }
    if (availableLanguageCodes.any(
      (code) => code.toLowerCase() == normalized,
    )) {
      return true;
    }
    return voices.any(
      (voice) => voice.languageCode.toLowerCase() == normalized,
    );
  }

  String resolveLanguage([String? preferredLanguage]) {
    final preferred = preferredLanguage?.trim().toLowerCase();
    if (preferred != null &&
        preferred.isNotEmpty &&
        supportsLanguage(preferred)) {
      return preferred;
    }

    final selected = selectedLanguage?.trim().toLowerCase();
    if (selected != null && selected.isNotEmpty && supportsLanguage(selected)) {
      return selected;
    }

    final fallbackDefault = defaultLanguage.trim().toLowerCase();
    if (fallbackDefault.isNotEmpty) {
      return fallbackDefault;
    }

    if (availableLanguageCodes.isNotEmpty) {
      return availableLanguageCodes.first;
    }

    if (voices.isNotEmpty) {
      return voices.first.languageCode.toLowerCase();
    }

    return 'en';
  }

  String get displayImageAsset => AppImages.person1;

  String get displayImageUrl =>
      _resolveCdnUrl(avatarUrl, UrlType.aiProfilePicture) ?? '';

  String get displayImagePath =>
      displayImageUrl.isNotEmpty ? displayImageUrl : displayImageAsset;

  bool get isNetworkImage => displayImageUrl.startsWith('http');

  String get displayRiveAssetPath =>
      _resolveCdnUrl(riveAssetUrl, UrlType.aiRiveAnimation) ?? '';

  String get displayRoleKey => 'characters.placeholderSubtitle';

  int get displayAge => 0;

  String displayLocation([String? preferredLanguage]) =>
      resolveLanguage(preferredLanguage).toUpperCase();

  static String? _resolveCdnUrl(String? value, UrlType type) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }

    return '${type.baseUrl}$normalized';
  }
}

class _JsonReader {
  const _JsonReader(this._data);

  final Map<String, dynamic> _data;

  String string(String key, {String fallback = ''}) =>
      _asString(_data[key], fallback: fallback);

  String stringAny(List<String> keys, {String fallback = ''}) {
    for (final key in keys) {
      if (_data.containsKey(key) && _data[key] != null) {
        return _asString(_data[key], fallback: fallback);
      }
    }
    return fallback;
  }

  String? optionalString(String key) => _asNullableString(_data[key]);

  String? optionalStringAny(List<String> keys) {
    for (final key in keys) {
      if (_data.containsKey(key) && _data[key] != null) {
        return _asNullableString(_data[key]);
      }
    }
    return null;
  }

  double? doubleValue(String key) => _asDouble(_data[key]);

  double? doubleAny(List<String> keys) {
    for (final key in keys) {
      if (_data.containsKey(key) && _data[key] != null) {
        return _asDouble(_data[key]);
      }
    }
    return null;
  }

  int? intValue(String key) => _asInt(_data[key]);

  int? intAny(List<String> keys) {
    for (final key in keys) {
      if (_data.containsKey(key) && _data[key] != null) {
        return _asInt(_data[key]);
      }
    }
    return null;
  }

  bool boolValue(String key, {required bool fallback}) =>
      _asBool(_data[key], fallback: fallback);

  bool boolAny(List<String> keys, {required bool fallback}) {
    for (final key in keys) {
      if (_data.containsKey(key) && _data[key] != null) {
        return _asBool(_data[key], fallback: fallback);
      }
    }
    return fallback;
  }

  static Map<String, dynamic>? asMap(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return value.map((key, val) => MapEntry(key.toString(), val));
    }
    return null;
  }

  static String _asString(dynamic value, {String fallback = ''}) {
    if (value == null) return fallback;
    if (value is String) return value;
    return value.toString();
  }

  static String? _asNullableString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static double? _asDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static int? _asInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static bool _asBool(dynamic value, {required bool fallback}) {
    if (value == null) return fallback;
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') {
        return true;
      }
      if (normalized == 'false' || normalized == '0') {
        return false;
      }
    }
    return fallback;
  }
}
