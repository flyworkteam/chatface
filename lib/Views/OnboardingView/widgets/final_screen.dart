import 'package:chatface/Views/OnboardingView/widgets/shared_photo_grid.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final size = MediaQuery.of(context).size;
    final gridHeight = size.height * 0.65;

    return Column(
      children: [
        // ── Fotoğraf grid'i ──────────────────────────────────────────────
        Expanded(
          flex: 4,
          child: OnboardingPhotoGrid(
            gridHeight: gridHeight,
            showBottomFade: true,
          ),
        ),

        // ── Metin ────────────────────────────────────────────────────────
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: t.onboarding.loading.titlePart1,
                      style: AppTextStyles.heading(
                        26,
                        FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: t.onboarding.loading.titlePart2,
                      style: AppTextStyles.heading(
                        26,
                        FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                t.onboarding.loading.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(14, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: SizedBox(height: 28)),
      ],
    );
  }
}
