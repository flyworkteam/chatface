import 'package:chatface/Views/SettingsSupportView/widgets/account_management.dart';
import 'package:chatface/Views/SettingsSupportView/widgets/premium_card.dart';
import 'package:chatface/Views/SettingsSupportView/widgets/settings_app_bar.dart';
import 'package:chatface/Views/SettingsSupportView/widgets/settings_hub.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsSupportView extends StatefulWidget {
  const SettingsSupportView({super.key});

  @override
  State<SettingsSupportView> createState() => _SettingsSupportViewState();
}

class _SettingsSupportViewState extends State<SettingsSupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const BlurredGradientBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        PremiumCard(),
                        const SizedBox(height: 28),
                        Text(
                          context.t.settingsSupport.settingsHub,
                          style: AppTextStyles.body(
                            16,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SettingsHub(),
                        const SizedBox(height: 28),
                        Text(
                          context.t.settingsSupport.accountManagement,
                          style: AppTextStyles.body(
                            16,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        AccountManagement(),
                        const SizedBox(height: 40),
                      ],
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
