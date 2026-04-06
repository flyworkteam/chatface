import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/profile_header.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class MessagesPageHeader extends ConsumerWidget {
  const MessagesPageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);
    final isPremium = user.asData?.value?.user.isPremium ?? false;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          user.when(
            data: (profileData) => ProfileHeader(user: profileData!.user),
            loading: () => CircularProgressIndicator(),
            error: (error, stackTrace) => SvgPicture.asset(AppIcons.warning),
          ),
          const Spacer(),
          PremiumBadge(isPremium: isPremium),
        ],
      ),
    );
  }
}

class PremiumBadge extends ConsumerStatefulWidget {
  const PremiumBadge({required this.isPremium, super.key});

  final bool isPremium;

  @override
  ConsumerState<PremiumBadge> createState() => _PremiumBadgeState();
}

class _PremiumBadgeState extends ConsumerState<PremiumBadge> {
  Offerings? _offerings;
  bool _isFetchingOfferings = false;

  @override
  void initState() {
    super.initState();
    // Mark all notifications as read when view opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchOfferings();
    });
  }

  Future<void> _fetchOfferings() async {
    if (_isFetchingOfferings) return;
    _isFetchingOfferings = true;
    try {
      final offerings = await Purchases.getOfferings();
      if (!mounted) return;
      setState(() {
        _offerings = offerings;
      });
    } catch (_) {
      // Intentionally ignored: paywall can still be shown with default offerings.
    } finally {
      _isFetchingOfferings = false;
    }
  }

  Future<void> _handlePremiumBannerTap({required bool isPremium}) async {
    if (isPremium) return;

    if (_offerings == null) {
      await _fetchOfferings();
    }

    final paywallResult = await RevenueCatUI.presentPaywall(
      offering: _offerings?.current,
    );

    if (paywallResult == PaywallResult.purchased) {
      await ref.read(userProfileProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePremiumBannerTap(isPremium: widget.isPremium),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppIcons.premium),
            SizedBox(width: 5),
            Text(
              context.t.premium,
              style: AppTextStyles.body(
                13,
                color: Colors.black,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
