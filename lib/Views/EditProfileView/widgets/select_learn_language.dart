import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectLearnLanguage extends StatelessWidget {
  const SelectLearnLanguage({
    super.key,
    required this.selectedCode,
    this.onChanged,
  });

  /// Current selected language code.
  final String selectedCode;

  /// Called when a new language is picked.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final languages = <({String code, String label, String flagAsset})>[
      (
        code: 'en',
        label: context.t.languageOptions.english,
        flagAsset: AppFlags.english,
      ),
      (
        code: 'de',
        label: context.t.languageOptions.german,
        flagAsset: AppFlags.german,
      ),
      (
        code: 'es',
        label: context.t.languageOptions.spanish,
        flagAsset: AppFlags.spanish,
      ),
      (
        code: 'fr',
        label: context.t.languageOptions.french,
        flagAsset: AppFlags.french,
      ),
      (
        code: 'hi',
        label: context.t.languageOptions.hindi,
        flagAsset: AppFlags.hindi,
      ),
      (
        code: 'it',
        label: context.t.languageOptions.italian,
        flagAsset: AppFlags.italian,
      ),
      (
        code: 'ja',
        label: context.t.languageOptions.japanese,
        flagAsset: AppFlags.japanese,
      ),
      (
        code: 'ko',
        label: context.t.languageOptions.korean,
        flagAsset: AppFlags.korean,
      ),
      (
        code: 'pt',
        label: context.t.languageOptions.portuguese,
        flagAsset: AppFlags.portugal,
      ),
      (
        code: 'ru',
        label: context.t.languageOptions.russian,
        flagAsset: AppFlags.russian,
      ),
      (
        code: 'tr',
        label: context.t.languageOptions.turkish,
        flagAsset: AppFlags.turkey,
      ),
    ];

    final selected = languages.firstWhere(
      (l) => l.code == selectedCode,
      orElse: () => languages.first,
    );

    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected.code,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white70,
          ),
          style: AppTextStyles.body(
            14,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
          dropdownColor: const Color(0xFF171721),
          selectedItemBuilder: (context) {
            return languages.map((lang) {
              return Row(
                children: [
                  SvgPicture.asset(lang.flagAsset, width: 22, height: 22),
                  const SizedBox(width: 10),
                  Text(
                    lang.label,
                    style: AppTextStyles.body(
                      14,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList();
          },
          items: languages.map((lang) {
            return DropdownMenuItem<String>(
              value: lang.code,
              child: Row(
                children: [
                  SvgPicture.asset(lang.flagAsset, width: 22, height: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      lang.label,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        14,
                        weight: lang.code == selected.code
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value == null) return;
            onChanged?.call(value);
          },
        ),
      ),
    );
  }
}
