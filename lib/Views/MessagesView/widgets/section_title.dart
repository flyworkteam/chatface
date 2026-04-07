import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: AppTextStyles.body(
          17,
          weight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
