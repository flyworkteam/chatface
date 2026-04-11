import 'package:chatface/Riverpod/Providers/notification_provider.dart';
import 'package:chatface/Views/EditProfileView/widgets/profile_text_field.dart';
import 'package:chatface/Views/SettingsSupportView/widgets/settings_tile_row.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsHub extends HookConsumerWidget {
  const SettingsHub({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsettings = ref.watch(notificationSettingsProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SettingsTileRow(
            icon: AppIcons.share,
            label: context.t.settingsSupport.shareTheApp,
            trailing: SvgPicture.asset(AppIcons.forward),
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) => _ShareSheet(
                onShareTap: () {
                  const shareLink = 'https://chatface.app/download';
                  Clipboard.setData(const ClipboardData(text: shareLink));

                  Navigator.pop(context);
                },
              ),
            ),
          ),
          SettingsTileRow(
            icon: AppIcons.rateUs,
            label: context.t.settingsSupport.rateUs,
            trailing: SvgPicture.asset(AppIcons.forward),
          ),
          SettingsTileRow(
            icon: AppIcons.version,
            label: context.t.settingsSupport.version,
            trailing: Text(
              Constants.appVersion,
              style: AppTextStyles.body(14, color: Colors.white60),
            ),
          ),
          notificationsettings.when(
            loading: () => SettingsTileRow(
              icon: AppIcons.notifications,
              label: context.t.settingsSupport.notifications,
              trailing: Switch(
                value: true,
                onChanged: null,
                padding: EdgeInsets.zero,
                activeThumbColor: Color(0xff774487),
                activeTrackColor: Colors.white,
                inactiveThumbColor: Colors.white54,
                inactiveTrackColor: Colors.white24,
              ),
            ),
            error: (_, _) => CupertinoSwitch(value: false, onChanged: null),
            data: (settings) {
              final isEnabled = settings?.notificationsEnabled ?? false;
              return SettingsTileRow(
                icon: AppIcons.notifications,
                isSwitch: true,
                label: context.t.settingsSupport.notifications,
                trailing: Switch(
                  padding: EdgeInsets.zero,
                  value: isEnabled,
                  onChanged: (v) async => await ref
                      .read(notificationSettingsProvider.notifier)
                      .toggleNotifications(v),
                  activeThumbColor: Color(0xff774487),
                  activeTrackColor: Colors.white,
                  inactiveThumbColor: Colors.white54,
                  inactiveTrackColor: Colors.white24,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ShareSheet extends HookWidget {
  final VoidCallback onShareTap;
  const _ShareSheet({required this.onShareTap});

  @override
  Widget build(BuildContext context) {
    final linkController = useTextEditingController(
      text: 'https://chatface.app/download',
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Text(
                context.t.settingsSupport.shareTheApp,
                style: AppTextStyles.body(
                  17,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: SvgPicture.asset(AppIcons.close)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ProfileTextField(
            hint: linkController.text,
            readOnly: true,
            label: '',
            controller: linkController,
            icon: AppIcons.link,
            trailingSuffix: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onShareTap,
              child: SizedBox(
                width: 18,
                height: 18,
                child: SvgPicture.asset(AppIcons.copy),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
