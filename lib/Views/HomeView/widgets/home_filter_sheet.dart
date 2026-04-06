import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFilterSheet extends HookConsumerWidget {
  const HomeFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(personaFilterProvider);
    final selectedGender = useState('');
    final selectedLanguage = useState<String?>(filters.language);
    final t = context.t;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3C2150), Color(0xFF120113)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () => Navigator.of(context).pop(),
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
          Text(
            t.editProfile.gender,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _SegmentButton(
                icon: Icons.male_rounded,
                label: t.onboarding.step3.male,
                isSelected: selectedGender.value == 'male',
                onTap: () => selectedGender.value = 'male',
              ),
              const SizedBox(width: 10),
              _SegmentButton(
                icon: Icons.female_rounded,
                label: t.onboarding.step3.female,
                isSelected: selectedGender.value == 'female',
                onTap: () => selectedGender.value = 'female',
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            t.editProfile.languagePreferences,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 12) / 2;

              return Wrap(
                spacing: 12,
                runSpacing: 10,
                children: _languageOptions.map((option) {
                  final isSelected = selectedLanguage.value == option.key;
                  final label = _resolveLanguageLabel(option.key, t);

                  return SizedBox(
                    width: itemWidth,
                    child: _LanguageChip(
                      isSelected: isSelected,
                      label: label,
                      iconPath: option.iconPath,
                      onTap: () {
                        selectedLanguage.value = isSelected ? null : option.key;
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                final notifier = ref.read(personaFilterProvider.notifier);
                await notifier.setGender(selectedGender.value);
                await notifier.setLanguage(selectedLanguage.value);
                if (context.mounted) Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF8A8792),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text(
                t.save,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
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

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF180D22),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.45),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.55),
                  fontWeight: FontWeight.w600,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFF130A1C),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(iconPath, height: 18, width: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
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
