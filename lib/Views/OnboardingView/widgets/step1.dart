import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Step1 extends HookWidget {
  const Step1({
    super.key,
    this.bottomPadding = 0,
    this.onNameChanged,
    this.initialName,
  });

  final double bottomPadding;
  final ValueChanged<String>? onNameChanged;
  final String? initialName;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final controller = useTextEditingController(text: initialName ?? '');
    final focusNode = useFocusNode();

    useEffect(() {
      void listener() {
        onNameChanged?.call(controller.text);
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            t.onboarding.step1.title,
            style: AppTextStyles.heading(
              30,
              FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            t.onboarding.step1.subtitle,
            style: AppTextStyles.body(
              14,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 28),
          _NameTextField(
            controller: controller,
            focusNode: focusNode,
            hint: t.onboarding.step1.hint,
          ),
        ],
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({
    required this.controller,
    required this.focusNode,
    required this.hint,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: AppTextStyles.body(16, color: Colors.white),
        cursorColor: AppColors.primary,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.body(
            16,
            color: Colors.white.withValues(alpha: 0.35),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
