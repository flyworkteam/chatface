import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.controller,
    this.readOnly = false,
    this.trailingSuffix,
    this.maxLength,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final String? icon;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? trailingSuffix;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final bool isSvg = icon?.endsWith('.svg') ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            14,
            weight: FontWeight.w700,
            letterSpacing: -0.05,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: keyboardType,
            maxLength: maxLength,
            textAlignVertical: TextAlignVertical.center,
            style: AppTextStyles.body(
              14,
              weight: FontWeight.bold,
              letterSpacing: -0.05,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hint,
              counterText: '',
              hintStyle: AppTextStyles.body(
                14,
                weight: FontWeight.bold,
                color: Colors.white.withValues(alpha: 0.68),
              ),
              prefixIcon: icon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: isSvg
                          ? SvgPicture.asset(
                              icon!,
                              width: 18,
                              height: 18,
                              colorFilter: ColorFilter.mode(
                                Colors.white.withValues(alpha: 0.8),
                                BlendMode.srcIn,
                              ),
                            )
                          : Image.asset(icon!, width: 18, height: 18),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              suffixIcon: trailingSuffix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 1,
                        heightFactor: 1,
                        child: trailingSuffix,
                      ),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
                maxWidth: 48,
                maxHeight: 48,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
