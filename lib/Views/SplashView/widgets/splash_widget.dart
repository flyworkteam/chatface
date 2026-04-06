import 'dart:ui';

import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_button.dart';
import 'package:chatface/shared/linear_box.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onGetStarted;
  final int currentPage;
  final int totalPages;

  const SplashWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onGetStarted,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // StoryCard ile aynı yaklaşım: asset'i ekranda görüneceği genişliğe göre decode et.
    const filterQuality = FilterQuality.high;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final int targetDecodeWidth = (screenWidth * dpr).round().clamp(256, 2048);

    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ResizeImage(
                  AssetImage(image),
                  width: targetDecodeWidth,
                  policy: ResizeImagePolicy.exact,
                ),
                fit: BoxFit.cover,
                filterQuality: filterQuality,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinearBox(height: screenHeight * 0.3),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Outer gradient border container
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.47],
                      colors: [
                        Colors.white.withValues(alpha: 0.4),
                        Colors.black.withValues(alpha: 0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.46, 1.0],
                            colors: [
                              Colors.black.withValues(alpha: 0.5),
                              Color(0xff666666).withValues(alpha: 0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Page indicators
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: List.generate(
                            //     totalPages,
                            //     (index) => AnimatedContainer(
                            //       duration: const Duration(milliseconds: 300),
                            //       margin: const EdgeInsets.symmetric(
                            //         horizontal: 4,
                            //       ),
                            //       width: index == currentPage ? 32 : 8,
                            //       height: 8,
                            //       decoration: BoxDecoration(
                            //         color: index == currentPage
                            //             ? AppColors.primary
                            //             : AppColors.secondary,
                            //         borderRadius: BorderRadius.circular(4),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // const SizedBox(height: 18),
                            Text(
                              title,
                              style: AppTextStyles.body(
                                26,
                                height: 27,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 12),

                            Text(
                              subtitle,
                              style: AppTextStyles.body(
                                14,
                                height: 18,
                                letterSpacing: -0.05,
                                weight: FontWeight.w300,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                            ),

                            const SizedBox(height: 18),

                            // Button
                            CustomButton(
                              label: context.t.get_started,
                              onPressed: onGetStarted,
                              size: CustomButtonSize.large,
                              borderRadius: 50,
                              fullWidth: true,
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.4,
                              ),
                              iconPosition: CustomButtonIconPosition.end,
                              icon: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.forward,

                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              labelStyle: AppTextStyles.body(
                                16,
                                height: 18,
                                weight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
