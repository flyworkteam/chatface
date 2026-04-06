import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/SettingsSupportView/widgets/settings_tile_row.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountManagement extends HookConsumerWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SettingsTileRow(
            icon: AppIcons.deleteAccount,
            label: context.t.settingsSupport.deleteAccount,
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => _DeleteConfirmationSheet(
                onDeleteTap: () {
                  Navigator.pop(context);
                  _showDeleteStep(context, 1, ref);
                },
              ),
            ),
          ),
          SettingsTileRow(
            icon: AppIcons.logout,
            label: context.t.settingsSupport.logOut,
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => _LogOutSheet(
                onLogOutTap: () {
                  Navigator.pop(context);
                  _handleLogout(context, ref);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDeleteStep(BuildContext context, int step, WidgetRef ref) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.7),
    builder: (_) {
      if (step == 1) {
        return _DeleteStep1Dialog(
          onContinue: () {
            Navigator.pop(context);
            _showDeleteStep(context, 2, ref);
          },
        );
      } else if (step == 2) {
        return _DeleteStep2Dialog(
          onContinue: () {
            Navigator.pop(context);
            _showDeleteStep(context, 3, ref);
          },
        );
      } else {
        return _DeleteStep3Dialog(
          onDeleteAccount: () {
            Navigator.pop(context);
            _handleDeleteAccount(context, ref);
          },
        );
      }
    },
  );
}

// ─────────────────────────────────────────────
// LogOutSheet
// ─────────────────────────────────────────────
class _LogOutSheet extends StatelessWidget {
  final VoidCallback onLogOutTap;
  const _LogOutSheet({required this.onLogOutTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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
                context.t.settingsSupport.logOut,
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
          const SizedBox(height: 24),
          // Avatar with X badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppIcons.logoutAccount,
                  width: 36,
                  height: 36,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.t.settingsSupport.logOutTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              16,
              color: Colors.white,
              weight: FontWeight.bold,
              height: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            context.t.settingsSupport.logOutSubtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(13, color: Colors.white60, height: 15),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: _DialogButton(
                  label: context.t.cancel,
                  onTap: () => Navigator.pop(context),
                  backgroundColor: Colors.grey.shade700,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DialogButton(
                  label: context.t.settingsSupport.logOut,
                  onTap: onLogOutTap,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Delete Confirmation Bottom Sheet (Image 1)
// ─────────────────────────────────────────────
class _DeleteConfirmationSheet extends StatelessWidget {
  final VoidCallback onDeleteTap;
  const _DeleteConfirmationSheet({required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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
                context.t.settingsSupport.deleteAccount,
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
          const SizedBox(height: 24),
          // Avatar with X badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppIcons.userDelete,
                  width: 36,
                  height: 36,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.t.deleteAccount.warning,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              16,
              color: Colors.white,
              weight: FontWeight.bold,
              height: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            context.t.deleteAccount.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(13, color: Colors.white60, height: 15),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: _DialogButton(
                  label: context.t.cancel,
                  onTap: () => Navigator.pop(context),
                  backgroundColor: Colors.grey.shade700,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DialogButton(
                  label: context.t.delete,
                  onTap: onDeleteTap,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Step 1 – Reason Selection Dialog (Image 2)
// ─────────────────────────────────────────────
class _DeleteStep1Dialog extends StatefulWidget {
  final VoidCallback onContinue;
  const _DeleteStep1Dialog({required this.onContinue});

  @override
  State<_DeleteStep1Dialog> createState() => _DeleteStep1DialogState();
}

class _DeleteStep1DialogState extends State<_DeleteStep1Dialog> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      context.t.deleteAccount.steps.step1.option1,
      context.t.deleteAccount.steps.step1.option2,
      context.t.deleteAccount.steps.step1.option3,
      context.t.deleteAccount.steps.step1.option4,
      context.t.deleteAccount.steps.step1.option5,
      context.t.deleteAccount.steps.step1.option6,
    ];
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.t.deleteAccount.steps.step1.title,
              style: AppTextStyles.body(
                16,
                color: Colors.white,
                weight: FontWeight.bold,
                height: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.t.deleteAccount.steps.step1.subtitle,
              style: AppTextStyles.body(13, color: Colors.white60, height: 14),
            ),
            const SizedBox(height: 16),
            ...List.generate(options.length, (i) {
              final selected = _selected == i;
              return GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected ? Colors.blueAccent : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selected
                                ? Colors.blueAccent
                                : Colors.white38,
                            width: 2,
                          ),
                        ),
                        child: selected
                            ? Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          options[i],
                          style: AppTextStyles.body(
                            13.5,
                            color: selected ? Colors.white : Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: context.t.cancel,
                    onTap: () => Navigator.pop(context),
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DialogButton(
                    label: context.t.kContinue,
                    onTap: widget.onContinue,
                    backgroundColor: Colors.grey.shade700,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Step 2 – Farewell Items Dialog (Image 3)
// ─────────────────────────────────────────────
class _DeleteStep2Dialog extends StatelessWidget {
  final VoidCallback onContinue;
  const _DeleteStep2Dialog({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        context.t.deleteAccount.steps.step2.subtitle1,
        context.t.deleteAccount.steps.step2.subtitle1Desc,
      ),
      (
        context.t.deleteAccount.steps.step2.subtitle2,
        context.t.deleteAccount.steps.step2.subtitle2Desc,
      ),
      (
        context.t.deleteAccount.steps.step2.subtitle3,
        context.t.deleteAccount.steps.step2.subtitle3Desc,
      ),
      (
        context.t.deleteAccount.steps.step2.subtitle4,
        context.t.deleteAccount.steps.step2.subtitle4Desc,
      ),
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.t.deleteAccount.steps.step2.title,
              style: AppTextStyles.body(
                16,
                color: Colors.white,
                weight: FontWeight.bold,
                height: 13,
              ),
            ),
            const SizedBox(height: 16),
            ...items.map(
              (item) => _FarewellItem(title: item.$1, description: item.$2),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: context.t.cancel,
                    onTap: () => Navigator.pop(context),
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DialogButton(
                    label: context.t.kContinue,
                    onTap: onContinue,
                    backgroundColor: Colors.grey.shade700,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FarewellItem extends StatelessWidget {
  final String title;
  final String description;
  const _FarewellItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.body(
              13.5,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyles.body(13, color: Colors.white70, height: 14),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Step 3 – Special Offer Dialog (Image 4)
// ─────────────────────────────────────────────
class _DeleteStep3Dialog extends StatelessWidget {
  final VoidCallback onDeleteAccount;
  const _DeleteStep3Dialog({required this.onDeleteAccount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.t.deleteAccount.steps.step3.title,
              style: AppTextStyles.body(
                16,
                color: Colors.white,
                weight: FontWeight.bold,
                height: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.t.deleteAccount.steps.step3.description,
              style: AppTextStyles.body(13, color: Colors.white60, height: 14),
            ),
            const SizedBox(height: 16),
            // Offer 1
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(14),
              ),
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.body(
                    13,
                    color: Colors.white70,
                    height: 14,
                  ),
                  children: [
                    TextSpan(
                      text: context.t.deleteAccount.steps.step3.description1(
                        offer: '',
                      ),
                    ),
                    TextSpan(
                      text:
                          context.t.deleteAccount.steps.step3.description1Offer,
                      style: AppTextStyles.body(
                        13,
                        color: Colors.white,
                        weight: FontWeight.bold,
                        height: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Offer 2
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(14),
              ),
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.body(
                    13,
                    color: Colors.white70,
                    height: 14,
                  ),
                  children: [
                    TextSpan(
                      text: context.t.deleteAccount.steps.step3.description2(
                        offer: '',
                      ),
                    ),
                    TextSpan(
                      text:
                          context.t.deleteAccount.steps.step3.description2Offer,
                      style: AppTextStyles.body(
                        13,
                        color: Colors.white,
                        weight: FontWeight.bold,
                        height: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            // Accept offer button
            _DialogButton(
              label: context.t.deleteAccount.steps.step3.acceptOffer,
              onTap: () => Navigator.pop(context),
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fullWidth: true,
              bold: true,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: context.t.cancel,
                    onTap: () => Navigator.pop(context),
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DialogButton(
                    label: context.t.deleteAccount.steps.step3.deleteMyAccount,
                    onTap: onDeleteAccount,
                    backgroundColor: Colors.grey.shade700,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Shared dialog button
// ─────────────────────────────────────────────
class _DialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final bool fullWidth;
  final bool bold;

  const _DialogButton({
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.fullWidth = false,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: AppTextStyles.body(
            14,
            color: textColor,
            weight: bold ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
  final closeLoader = _showBlockingDialog(context);
  try {
    await ref.read(AllProviders.authRepositoryProvider).logout();
    await ref.read(AllProviders.secureStorageServiceProvider).clearAll();
    if (!context.mounted) return;
    closeLoader();
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
  } catch (e) {
    if (!context.mounted) return;
    _showSnack(context, 'Failed to log out. Please try again.');
  } finally {
    closeLoader();
  }
}

Future<void> _handleDeleteAccount(BuildContext context, WidgetRef ref) async {
  final closeLoader = _showBlockingDialog(context);
  try {
    final success = await ref.read(userRepositoryProvider).deleteAccount();
    if (!success) {
      if (!context.mounted) return;
      _showSnack(context, 'Unable to delete account. Please try again.');
      return;
    }
    await ref.read(AllProviders.secureStorageServiceProvider).clearAll();
    if (!context.mounted) return;
    closeLoader();
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
  } catch (e) {
    if (!context.mounted) return;
    _showSnack(context, 'Unable to delete account. Please try again.');
  } finally {
    closeLoader();
  }
}

VoidCallback _showBlockingDialog(BuildContext context) {
  var closed = false;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );
  return () {
    if (closed) return;
    closed = true;
    Navigator.of(context, rootNavigator: true).pop();
  };
}

void _showSnack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
