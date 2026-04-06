import 'dart:io';

import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Services/social_auth_service.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/shared/custom_button.dart';
import 'package:chatface/shared/policy_bottom_sheet.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  Future<void> _handleGoogleSignIn(BuildContext context, WidgetRef ref) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final socialAuthService = ref.read(socialAuthServiceProvider);
      final idToken = await socialAuthService.signInWithGoogle();

      if (idToken == null) {
        if (context.mounted) Navigator.pop(context);
        return;
      }

      final authRepo = ref.read(AllProviders.authRepositoryProvider);
      final response = await authRepo.signInWithGoogle(idToken: idToken);

      if (context.mounted) {
        Navigator.pop(context);

        if (response.user?.onboardingCompleted == true) {
          await ref.watch(userProfileProvider.notifier).refresh();

          if (context.mounted) Navigator.pushReplacementNamed(context, '/main');
        } else {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.auth.signInFailed(error: e.toString())),
          ),
        );
      }
    }
  }

  Future<void> _handleAppleSignIn(BuildContext context, WidgetRef ref) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final socialAuthService = ref.read(socialAuthServiceProvider);
      final appleCredential = await socialAuthService.signInWithApple();

      if (appleCredential == null) {
        if (context.mounted) Navigator.pop(context);
        return;
      }

      final authRepo = ref.read(AllProviders.authRepositoryProvider);
      final response = await authRepo.signInWithApple(
        identityToken: appleCredential['identityToken'] as String,
        appleUserInfo: appleCredential['user'] as Map<String, dynamic>?,
      );

      if (context.mounted) {
        Navigator.pop(context);

        if (response.user?.onboardingCompleted == true) {
          await ref.watch(userProfileProvider.notifier).refresh();
          if (context.mounted) Navigator.pushReplacementNamed(context, '/main');
        } else {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.auth.signInFailed(error: e.toString())),
          ),
        );
      }
    }
  }

  Future<void> _handleGuestLogin(BuildContext context, WidgetRef ref) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final authRepo = ref.read(AllProviders.authRepositoryProvider);
      await authRepo.createGuestUser(
        deviceInfo: {'platform': Platform.operatingSystem},
      );

      if (context.mounted) {
        Navigator.pop(context);

        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.auth.signInFailed(error: e.toString())),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizedWelcome = context.t.welcome2(
      appName: '\n ${Constants.appName}',
    );
    final parts = localizedWelcome.split(Constants.appName);
    final prefix = parts.isNotEmpty ? parts.first : '';
    final suffix = parts.length > 1
        ? parts.sublist(1).join(Constants.appName)
        : '';

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const BlurredGradientBackground(),
          Padding(
            padding: AppPaddings.horizontalPage,
            child: Column(
              children: [
                Spacer(flex: 4),
                Image.asset(AppAssets.logo, width: 102, height: 102),
                const SizedBox(height: 60),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: prefix,
                        style: AppTextStyles.body(
                          36,
                          weight: FontWeight.bold,
                          height: 35,
                          letterSpacing: -0.05,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: Constants.appName,
                        style: AppTextStyles.body(
                          36,
                          weight: FontWeight.bold,
                          height: 35,
                          letterSpacing: -0.05,
                          color: Colors.white,
                        ),
                      ),
                      if (suffix.isNotEmpty)
                        TextSpan(
                          text: suffix,
                          style: AppTextStyles.body(
                            36,
                            weight: FontWeight.bold,
                            height: 35,
                            letterSpacing: -0.05,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 13),

                // Text(
                //   context.t.logintext,
                //   style: AppTextStyles.body(
                //     20,
                //     weight: FontWeight.w300,
                //     color: Colors.black,
                //     height: 25,
                //     letterSpacing: -0.05,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 42),
                if (Platform.isAndroid) ...[
                  CustomButton(
                    label: context.t.auth.google,
                    fullWidth: true,
                    type: CustomButtonType.filled,
                    icon: SvgPicture.asset(AppIcons.google),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    borderColor: const Color(0xFFD9D9D9),
                    iconPadding: 8,
                    borderWidth: 1.0,
                    borderRadius: 50.0,
                    labelStyle: AppTextStyles.body(15, weight: FontWeight.w400),
                    onPressed: () => _handleGoogleSignIn(context, ref),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    label: context.t.auth.apple,
                    type: CustomButtonType.filled,
                    icon: SvgPicture.asset(AppIcons.apple),
                    fullWidth: true,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    borderWidth: 1.0,
                    iconPadding: 8,
                    borderRadius: 50.0,
                    labelStyle: AppTextStyles.body(
                      15,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    onPressed: () => _handleAppleSignIn(context, ref),
                  ),
                ] else ...[
                  CustomButton(
                    label: context.t.auth.apple,
                    type: CustomButtonType.filled,
                    icon: SvgPicture.asset(AppIcons.apple),
                    fullWidth: true,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    borderColor: Colors.white.withValues(alpha: 0.5),
                    borderWidth: 0.5,
                    iconPadding: 8,
                    borderRadius: 50.0,
                    labelStyle: AppTextStyles.body(
                      15,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    onPressed: () => _handleAppleSignIn(context, ref),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    label: context.t.auth.google,
                    type: CustomButtonType.filled,
                    icon: SvgPicture.asset(AppIcons.google),
                    fullWidth: true,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    borderColor: const Color(0xFFD9D9D9),
                    borderWidth: 1.0,
                    iconPadding: 8,
                    borderRadius: 50.0,
                    labelStyle: AppTextStyles.body(
                      15,
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    onPressed: () => _handleGoogleSignIn(context, ref),
                  ),
                ],
                const SizedBox(height: 16),
                CustomButton(
                  label: context.t.auth.guest,
                  onPressed: () => _handleGuestLogin(context, ref),
                  size: CustomButtonSize.large,
                  type: CustomButtonType.text,
                  borderRadius: 50,
                  fullWidth: true,
                  foregroundColor: Colors.white,
                  labelStyle: AppTextStyles.body(
                    18,
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                SafeArea(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(text: context.t.termOfService.text1),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () =>
                                showPolicySheet(context, PolicyType.terms),
                            child: Text(
                              context.t.termOfService.link1,
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(text: context.t.termOfService.text2),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () =>
                                showPolicySheet(context, PolicyType.privacy),
                            child: Text(
                              context.t.termOfService.link2,
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(text: context.t.termOfService.text3),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () =>
                                showPolicySheet(context, PolicyType.cookies),
                            child: Text(
                              context.t.termOfService.link3,
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        if (TranslationProvider.of(
                              context,
                            ).locale.languageCode ==
                            'tr')
                          TextSpan(text: context.t.termOfService.text4),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
