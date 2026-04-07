import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Gender { male, female, preferNotToSay }

class Step3 extends HookWidget {
  const Step3({
    super.key,
    this.bottomPadding = 0,
    this.onGenderChanged,
    this.initialGender,
  });

  final double bottomPadding;
  final ValueChanged<Gender?>? onGenderChanged;
  final Gender? initialGender;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final selected = useState<Gender?>(initialGender);

    void select(Gender g) {
      selected.value = g;
      onGenderChanged?.call(g);
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              t.onboarding.step3.title,
              style: AppTextStyles.heading(
                30,
                FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              t.onboarding.step3.subtitle,
              style: AppTextStyles.body(
                14,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 28),
            _GenderButton(
              label: t.onboarding.step3.male,
              iconPath: 'assets/icons/male.svg',
              isSelected: selected.value == Gender.male,
              onTap: () => select(Gender.male),
            ),
            const SizedBox(height: 12),
            _GenderButton(
              label: t.onboarding.step3.female,
              iconPath: 'assets/icons/female.svg',
              isSelected: selected.value == Gender.female,
              onTap: () => select(Gender.female),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () => select(Gender.preferNotToSay),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: AppTextStyles.body(
                    14,
                    color: selected.value == Gender.preferNotToSay
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.45),
                    weight: selected.value == Gender.preferNotToSay
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                  child: Text(t.onboarding.step3.dontWantToMention),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.12),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.45),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: AppTextStyles.body(
                16,
                weight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
