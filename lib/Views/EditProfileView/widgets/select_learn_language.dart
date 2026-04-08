import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fieldWidth = constraints.maxWidth;
          const horizontalInset = 16.0;
          final menuWidth = fieldWidth + (horizontalInset * 2);

          return Theme(
            data: Theme.of(context).copyWith(platform: TargetPlatform.android),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: selected.code,
                isExpanded: true,
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white70,
                  ),
                ),
                buttonStyleData: ButtonStyleData(height: 46, width: fieldWidth),
                style: AppTextStyles.body(
                  14,
                  weight: FontWeight.bold,
                  color: Colors.white,
                ),
                dropdownStyleData: DropdownStyleData(
                  width: menuWidth,
                  maxHeight: 150,
                  offset: const Offset(-horizontalInset, -5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF171721),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: WidgetStateProperty.resolveWith(
                      (_) => Colors.white,
                    ),
                    thumbVisibility: WidgetStateProperty.all(true),
                    trackVisibility: WidgetStateProperty.all(false),
                    thickness: WidgetStateProperty.all(1.5),
                    radius: const Radius.circular(8),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 44,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                selectedItemBuilder: (context) {
                  return languages.map((lang) {
                    return Center(
                      child: Text(
                        lang.label,
                        style: AppTextStyles.body(
                          14,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList();
                },
                items: languages.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang.code,
                    child: Center(
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
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  onChanged?.call(value);
                  LocaleSettings.setLocale(AppLocale.values.byName(value));
                  SecureStorageService().saveLanguage(value);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
