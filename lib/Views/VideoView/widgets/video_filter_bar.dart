import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/Views/CallView/widgets/call_language_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Gender ve Country/Language dropdown'ları
/// Tasarım: Alt kısımda yan yana iki dropdown butonu
class VideoFilterBar extends StatelessWidget {
  const VideoFilterBar({
    super.key,
    required this.selectedGender,
    required this.selectedLanguage,
    required this.onGenderTap,
    required this.onLanguageTap,
  });

  final String? selectedGender;
  final String? selectedLanguage;
  final VoidCallback onGenderTap;
  final VoidCallback onLanguageTap;

  @override
  Widget build(BuildContext context) {
    final selectedLanguageMeta = _callLanguageForCode(selectedLanguage);
    final countryFlag = _flagForLanguageCode(selectedLanguage);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,

        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _FilterChip(
            iconAsset: AppIcons.gender,
            label: _genderLabel(selectedGender),
            onTap: onGenderTap,
          ),
          const SizedBox(width: 12),
          _FilterChip(
            iconAsset: countryFlag,
            label: selectedLanguageMeta?.name ?? 'Language',
            onTap: onLanguageTap,
          ),
        ],
      ),
    );
  }

  String _genderLabel(String? gender) {
    switch (gender?.trim().toLowerCase()) {
      case 'male':
        return 'Male';
      case 'female':
        return 'Female';
      default:
        return 'Gender';
    }
  }

  CallLanguage? _callLanguageForCode(String? languageCode) {
    if (languageCode == null || languageCode.isEmpty) {
      return null;
    }
    for (final language in callLanguages) {
      if (language.code == languageCode.toLowerCase()) {
        return language;
      }
    }
    return null;
  }

  String _flagForLanguageCode(String? languageCode) {
    switch (languageCode?.toLowerCase()) {
      case 'tr':
        return AppFlags.turkey;
      case 'de':
        return AppFlags.german;
      case 'fr':
        return AppFlags.french;
      case 'es':
        return AppFlags.spanish;
      case 'ko':
        return AppFlags.korean;
      case 'it':
        return AppFlags.italian;
      case 'ja':
        return AppFlags.japanese;
      case 'ru':
        return AppFlags.russian;
      case 'pt':
        return AppFlags.portugal;
      case 'hi':
        return AppFlags.hindi;
      case 'zh':
        return AppFlags.china;
      case 'en':
      default:
        return AppFlags.english;
    }
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.18),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconAsset, width: 16, height: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.rubik(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white.withValues(alpha: 0.6),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

/// Gender seçim popup'ı
class GenderPickerSheet extends StatelessWidget {
  const GenderPickerSheet({super.key, required this.selectedGender});

  final String? selectedGender;

  @override
  Widget build(BuildContext context) {
    const genders = [('male', 'Male'), ('female', 'Female')];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: genders.map((gender) {
          final code = gender.$1;
          final label = gender.$2;
          final isSelected = selectedGender?.toLowerCase() == code;
          return ListTile(
            title: Text(
              label,
              style: GoogleFonts.rubik(
                color: isSelected ? AppColors.primary : Colors.white,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16,
              ),
            ),
            trailing: isSelected
                ? const Icon(Icons.check, color: AppColors.primary)
                : null,
            onTap: () => Navigator.pop(context, code),
          );
        }).toList(),
      ),
    );
  }
}

/// Dil seçim popup'ı
class LanguagePickerSheet extends StatelessWidget {
  const LanguagePickerSheet({super.key, required this.selectedLanguage});

  final String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: callLanguages.length,
        itemBuilder: (context, index) {
          final language = callLanguages[index];
          final isSelected = selectedLanguage == language.code;
          return ListTile(
            title: Text(
              language.name,
              style: GoogleFonts.rubik(
                color: isSelected ? AppColors.primary : Colors.white,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              language.nativeName,
              style: GoogleFonts.rubik(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
            trailing: isSelected
                ? const Icon(Icons.check, color: AppColors.primary)
                : null,
            onTap: () => Navigator.pop(context, language.code),
          );
        },
      ),
    );
  }
}
