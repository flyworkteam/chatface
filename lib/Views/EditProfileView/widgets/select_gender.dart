import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({super.key, required this.selectedCode, this.onChanged});

  /// Current selected language code.
  final String selectedCode;

  /// Called when a new language is picked.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final genders = <({String code, String label, String flagAsset})>[
      (
        code: 'male',
        label: context.t.editProfile.male,
        flagAsset: AppIcons.male,
      ),
      (
        code: 'female',
        label: context.t.editProfile.female,
        flagAsset: AppIcons.female,
      ),
      (
        code: 'dont_say',
        label: context.t.editProfile.dontWantToMention,
        flagAsset: AppIcons.gender,
      ),
    ];

    final selected = genders.firstWhere(
      (g) => g.code == selectedCode,
      orElse: () => genders.first,
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
            return genders.map((gender) {
              return Row(
                children: [
                  SvgPicture.asset(gender.flagAsset, width: 22, height: 22),
                  const SizedBox(width: 10),
                  Text(
                    gender.label,
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
          items: genders.map((gender) {
            return DropdownMenuItem<String>(
              value: gender.code,
              child: Row(
                children: [
                  SvgPicture.asset(gender.flagAsset, width: 22, height: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      gender.label,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        14,
                        weight: gender.code == selected.code
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
