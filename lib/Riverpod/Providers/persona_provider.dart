import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:riverpod/riverpod.dart';

final personaListProvider = FutureProvider<List<PersonaProfile>>((ref) async {
  final repo = ref.read(AllProviders.aiRepositoryProvider);
  return repo.fetchPersonas();
});

final followedPersonaListProvider = FutureProvider<List<PersonaProfile>>((
  ref,
) async {
  final repo = ref.read(AllProviders.aiRepositoryProvider);
  return repo.fetchPersonas(followedOnly: true);
});

final filteredPersonaListProvider = FutureProvider<List<PersonaProfile>>((
  ref,
) async {
  final repo = ref.read(AllProviders.aiRepositoryProvider);
  final filters = ref.watch(personaFilterProvider);
  final personas = await repo.fetchPersonas(gender: filters.gender);
  final selectedLanguage = filters.language?.trim().toLowerCase();

  if (selectedLanguage == null || selectedLanguage.isEmpty) {
    return personas;
  }

  return personas
      .where((persona) => persona.supportsLanguage(selectedLanguage))
      .toList(growable: false);
});

class PersonaFilter {
  const PersonaFilter({this.gender, this.language});

  final String? gender;
  final String? language;

  static const _sentinel = Object();

  PersonaFilter copyWith({
    Object? gender = _sentinel,
    Object? language = _sentinel,
  }) {
    return PersonaFilter(
      gender: identical(gender, _sentinel) ? this.gender : gender as String?,
      language: identical(language, _sentinel)
          ? this.language
          : language as String?,
    );
  }
}

final personaFilterProvider =
    NotifierProvider.autoDispose<PersonaFilterNotifier, PersonaFilter>(
      PersonaFilterNotifier.new,
    );

final personaFollowControllerProvider = Provider<PersonaFollowController>((ref) {
  return PersonaFollowController(ref);
});

class PersonaFollowController {
  PersonaFollowController(this.ref);

  final Ref ref;

  Future<bool> setFollowed({
    required String personaId,
    required bool shouldFollow,
  }) async {
    final repo = ref.read(AllProviders.aiRepositoryProvider);

    if (shouldFollow) {
      await repo.followPersona(personaId);
    } else {
      await repo.unfollowPersona(personaId);
    }

    ref.invalidate(personaListProvider);
    ref.invalidate(filteredPersonaListProvider);
    ref.invalidate(followedPersonaListProvider);
    return shouldFollow;
  }
}

class PersonaFilterNotifier extends Notifier<PersonaFilter> {
  late final SecureStorageService _storage = ref.read(
    AllProviders.secureStorageServiceProvider,
  );

  @override
  PersonaFilter build() {
    _restore();
    return const PersonaFilter();
  }

  static const Map<String, String> _languageAliases = {
    'english': 'en',
    'turkish': 'tr',
    'spanish': 'es',
    'french': 'fr',
    'german': 'de',
    'portuguese': 'pt',
    'italian': 'it',
    'arabic': 'ar',
    'japanese': 'ja',
    'korean': 'ko',
    'chinese': 'zh',
    'russian': 'ru',
    'hindi': 'hi',
  };

  String? _normalizeGender(String? gender) {
    final normalized = gender?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    if (normalized == 'male' || normalized == 'female') {
      return normalized;
    }
    return null;
  }

  String? _normalizeLanguage(String? language) {
    final normalized = language?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return _languageAliases[normalized] ?? normalized;
  }

  Future<void> _restore() async {
    final gender = _normalizeGender(
      await _storage.getSelectedCharacterGender(),
    );
    final language = _normalizeLanguage(
      await _storage.getSelectedCharacterLanguage(),
    );
    state = PersonaFilter(gender: gender, language: language);
  }

  Future<void> setGender(String? gender) async {
    final normalized = _normalizeGender(gender);
    state = state.copyWith(gender: normalized);
    await _storage.saveCharacterFilters(gender: normalized);
  }

  Future<void> setLanguage(String? language) async {
    final normalized = _normalizeLanguage(language);
    state = state.copyWith(language: normalized);
    await _storage.saveCharacterFilters(language: normalized);
  }
}
