import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFilterSheet extends HookConsumerWidget {
  const HomeFilterSheet({super.key, this.onClose, this.bottomPadding});

  final VoidCallback? onClose;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(personaFilterProvider);
    final selectedGender = useState(filters.gender ?? '');
    final selectedLanguage = useState<String?>(
      _languageOptionKeyByValue(filters.language),
    );
    final t = context.t;
    final sheetHeight = MediaQuery.sizeOf(context).height * 0.7;
    final effectiveBottomPadding =
        (40 + MediaQuery.viewPaddingOf(context).bottom);

    useEffect(() {
      selectedGender.value = filters.gender ?? '';
      selectedLanguage.value = _languageOptionKeyByValue(filters.language);
      return null;
    }, [filters.gender, filters.language]);

    return SizedBox(
      height: sheetHeight,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3C2150), Color(0xFF120113)],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, effectiveBottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 26,
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      width: 52,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (onClose != null) {
                          onClose!();
                          return;
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Text(
                      t.editProfile.gender,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body(
                        18,
                        weight: FontWeight.w700,
                        letterSpacing: 0.1 / 18,
                        height: 18 * 1.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SegmentButton(
                          icon: AppIcons.male,
                          label: t.onboarding.step3.male,
                          isSelected: selectedGender.value == 'male',
                          onTap: () => selectedGender.value = 'male',
                        ),
                        const SizedBox(width: 20),
                        _SegmentButton(
                          icon: AppIcons.female,
                          label: t.onboarding.step3.female,
                          isSelected: selectedGender.value == 'female',
                          onTap: () => selectedGender.value = 'female',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      t.editProfile.languagePreferences,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body(
                        18,
                        weight: FontWeight.w700,
                        letterSpacing: 0.1 / 18,
                        height: 18 * 1.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final itemWidth = (constraints.maxWidth - 32) / 2.2;

                        return Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: _languageOptions.map((option) {
                            final isSelected =
                                selectedLanguage.value == option.key;
                            final label = _resolveLanguageLabel(option.key, t);

                            return SizedBox(
                              width: itemWidth,
                              child: _LanguageChip(
                                isSelected: isSelected,
                                label: label,
                                iconPath: option.iconPath,
                                onTap: () {
                                  selectedLanguage.value = isSelected
                                      ? null
                                      : option.key;
                                },
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  final notifier = ref.read(personaFilterProvider.notifier);
                  await notifier.setGender(selectedGender.value);
                  if (selectedLanguage.value != null) {
                    final selected = selectedLanguage.value!;
                    // Map the selected language key (e.g. 'english') to the
                    // locale code (e.g. 'en') expected by `AppLocale`.
                    final code = _languageOptionValues[selected] ?? selected;
                    LocaleSettings.setLocale(AppLocale.values.byName(code));
                    SecureStorageService().saveLanguage(code);
                  }
                  if (onClose != null) {
                    onClose?.call();
                    return;
                  }
                  if (context.mounted) Navigator.of(context).pop();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF8A8792),
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  t.save,
                  style: AppTextStyles.body(
                    18,
                    weight: FontWeight.w700,
                    letterSpacing: 0.1 / 18,
                    height: 18 * 1.3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 140),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF180D22),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                height: 16,
                width: 16,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.45),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.body(
                  14,
                  weight: FontWeight.w600,
                  letterSpacing: 0.1 / 14,
                  height: 14 * 1.25,
                  color: isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.isSelected,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  final bool isSelected;
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xFF130A1C),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  SvgPicture.asset(iconPath, height: 16, width: 16),
                  Spacer(),
                  Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(
                      14,
                      weight: FontWeight.w500,
                      letterSpacing: 0.1 / 14,
                      height: 14 * 1.25,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption {
  const _LanguageOption({required this.key, required this.iconPath});
  final String key;
  final String iconPath;
}

const _languageOptions = [
  _LanguageOption(key: 'turkish', iconPath: AppFlags.turkey),
  _LanguageOption(key: 'english', iconPath: AppFlags.english),
  _LanguageOption(key: 'german', iconPath: AppFlags.german),
  _LanguageOption(key: 'italian', iconPath: AppFlags.italian),
  _LanguageOption(key: 'french', iconPath: AppFlags.french),
  _LanguageOption(key: 'japanese', iconPath: AppFlags.japanese),
  _LanguageOption(key: 'spanish', iconPath: AppFlags.spanish),
  _LanguageOption(key: 'russian', iconPath: AppFlags.russian),
  _LanguageOption(key: 'korean', iconPath: AppFlags.korean),
  _LanguageOption(key: 'hindi', iconPath: AppFlags.hindi),
  _LanguageOption(key: 'portuguese', iconPath: AppFlags.portugal),
  _LanguageOption(key: 'chinese', iconPath: AppFlags.china),
];

const _languageOptionValues = {
  'turkish': 'tr',
  'english': 'en',
  'german': 'de',
  'italian': 'it',
  'french': 'fr',
  'japanese': 'ja',
  'spanish': 'es',
  'russian': 'ru',
  'korean': 'ko',
  'hindi': 'hi',
  'portuguese': 'pt',
  'chinese': 'zh',
};

String? _languageOptionKeyByValue(String? value) {
  final normalized = value?.trim().toLowerCase();
  if (normalized == null || normalized.isEmpty) {
    return null;
  }

  return _languageOptionValues.entries
      .firstWhere(
        (entry) => entry.key == normalized || entry.value == normalized,
        orElse: () => MapEntry(normalized, normalized),
      )
      .key;
}

String _resolveLanguageLabel(String key, Translations t) {
  final map = t.languageOptions;
  return switch (key) {
    'turkish' => map.turkish,
    'english' => map.english,
    'german' => map.german,
    'italian' => map.italian,
    'french' => map.french,
    'japanese' => map.japanese,
    'spanish' => map.spanish,
    'russian' => map.russian,
    'korean' => map.korean,
    'hindi' => map.hindi,
    'portuguese' => map.portuguese,
    'chinese' => map.chinese,
    _ => key,
  };
}
