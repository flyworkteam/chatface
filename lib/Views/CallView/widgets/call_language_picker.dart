import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Supported AI conversation languages.
class CallLanguage {
  const CallLanguage({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flag,
  });

  final String code;
  final String name;
  final String nativeName;
  final String flag;
}

const callLanguages = <CallLanguage>[
  CallLanguage(
    code: 'en',
    name: 'English',
    nativeName: 'English',
    flag: '🇺🇸',
  ),
  CallLanguage(code: 'tr', name: 'Turkish', nativeName: 'Türkçe', flag: '🇹🇷'),
  CallLanguage(
    code: 'es',
    name: 'Spanish',
    nativeName: 'Español',
    flag: '🇪🇸',
  ),
  CallLanguage(
    code: 'fr',
    name: 'French',
    nativeName: 'Français',
    flag: '🇫🇷',
  ),
  CallLanguage(code: 'de', name: 'German', nativeName: 'Deutsch', flag: '🇩🇪'),
  CallLanguage(
    code: 'pt',
    name: 'Portuguese',
    nativeName: 'Português',
    flag: '🇧🇷',
  ),
  CallLanguage(
    code: 'it',
    name: 'Italian',
    nativeName: 'Italiano',
    flag: '🇮🇹',
  ),
  CallLanguage(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी', flag: '🇮🇳'),
  CallLanguage(code: 'ja', name: 'Japanese', nativeName: '日本語', flag: '🇯🇵'),
  CallLanguage(code: 'ko', name: 'Korean', nativeName: '한국어', flag: '🇰🇷'),
  CallLanguage(code: 'zh', name: 'Chinese', nativeName: '中文', flag: '🇨🇳'),
  CallLanguage(
    code: 'ru',
    name: 'Russian',
    nativeName: 'Русский',
    flag: '🇷🇺',
  ),
];

/// Shows a bottom sheet language picker and returns the selected language code.
Future<String?> showCallLanguagePicker(
  BuildContext context, {
  String? currentLanguage,
  List<String>? supportedLanguages,
}) async {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => _LanguagePickerSheet(
      currentLanguage: currentLanguage,
      supportedLanguages: supportedLanguages,
    ),
  );
}

class _LanguagePickerSheet extends StatelessWidget {
  const _LanguagePickerSheet({this.currentLanguage, this.supportedLanguages});

  final String? currentLanguage;
  final List<String>? supportedLanguages;

  String _normalizeCode(String? rawCode) {
    final normalized = rawCode?.trim().toLowerCase() ?? '';
    if (normalized.isEmpty) {
      return '';
    }

    final separatorIndex = normalized.indexOf(RegExp(r'[-_]'));
    if (separatorIndex > 0) {
      return normalized.substring(0, separatorIndex);
    }

    return normalized;
  }

  Set<String> _normalizedSupportedCodes() {
    final rawSupported = supportedLanguages ?? const [];
    final normalized = <String>{};

    for (final raw in rawSupported) {
      final trimmed = raw.trim();
      if (trimmed.isEmpty) {
        continue;
      }

      final code = _normalizeCode(trimmed);
      if (code.isNotEmpty) {
        normalized.add(code);
      }

      final lowered = trimmed.toLowerCase();
      for (final language in callLanguages) {
        if (language.name.toLowerCase() == lowered ||
            language.nativeName.toLowerCase() == lowered) {
          normalized.add(language.code);
        }
      }
    }

    return normalized;
  }

  @override
  Widget build(BuildContext context) {
    final normalizedCurrent = _normalizeCode(currentLanguage);
    final normalizedSupported = _normalizedSupportedCodes();
    final filteredLanguages = normalizedSupported.isEmpty
        ? callLanguages
        : callLanguages
              .where((language) => normalizedSupported.contains(language.code))
              .toList();
    final languages = filteredLanguages.isEmpty
        ? callLanguages
        : filteredLanguages;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      constraints: BoxConstraints(maxHeight: mediaQuery.size.height * 0.78),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1525),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: const Color(0xFF25314B)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x7A000000),
            blurRadius: 22,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            12,
            16,
            mediaQuery.padding.bottom + 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose language',
                          style: GoogleFonts.rubik(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'AI will speak and listen in this language',
                          style: GoogleFonts.rubik(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    color: Colors.white.withValues(alpha: 0.78),
                    splashRadius: 20,
                    tooltip: context.t.common.close,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = lang.code == normalizedCurrent;
                    return _LanguageTile(
                      language: lang,
                      isSelected: isSelected,
                      onTap: () => Navigator.pop(context, lang.code),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  final CallLanguage language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF183A66)
                : const Color(0xFF151E33),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF4CC9F0)
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(language.flag, style: AppTextStyles.body(23)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language.name,
                      style: GoogleFonts.rubik(
                        fontSize: 15,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      language.nativeName,
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.78),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF4CC9F0)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF4CC9F0)
                        : Colors.white.withValues(alpha: 0.35),
                    width: 1.6,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Color(0xFF0E1525),
                        size: 16,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
