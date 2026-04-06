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
  CallLanguage(code: 'ar', name: 'Arabic', nativeName: 'العربية', flag: '🇸🇦'),
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

  @override
  Widget build(BuildContext context) {
    final normalizedSupported = supportedLanguages
        ?.map((code) => code.trim().toLowerCase())
        .where((code) => code.isNotEmpty)
        .toSet();
    final languages = normalizedSupported == null || normalizedSupported.isEmpty
        ? callLanguages
        : callLanguages
              .where((language) => normalizedSupported.contains(language.code))
              .toList();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Choose Language',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'AI will speak and listen in this language',
              style: GoogleFonts.rubik(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 380,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final isSelected = lang.code == currentLanguage;
                  return _LanguageTile(
                    language: lang,
                    isSelected: isSelected,
                    onTap: () => Navigator.pop(context, lang.code),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7C3AED).withValues(alpha: 0.25)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF7C3AED).withValues(alpha: 0.6),
                )
              : null,
        ),
        child: Row(
          children: [
            Text(language.flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 14),
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
                          : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    language.nativeName,
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF7C3AED),
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
