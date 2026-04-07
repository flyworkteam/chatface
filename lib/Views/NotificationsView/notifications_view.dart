import 'package:chatface/Models/notification_model.dart';
import 'package:chatface/Riverpod/Providers/notification_provider.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/NotificationsView/widgets/notifications_card.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class NotificationsView extends ConsumerStatefulWidget {
  const NotificationsView({super.key});

  @override
  ConsumerState<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends ConsumerState<NotificationsView> {
  // Offerings? _offerings;
  bool _isFetchingOfferings = false;

  @override
  void initState() {
    super.initState();
    // Mark all notifications as read when view opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationHistoryProvider.notifier).markAllAsRead();
      _fetchOfferings();
    });
  }

  Future<void> _fetchOfferings() async {
    if (_isFetchingOfferings) return;
    _isFetchingOfferings = true;
    try {
      // final offerings = await Purchases.getOfferings();
      // if (!mounted) return;
      // setState(() {
      //   // _offerings = offerings;
      // });
    } catch (_) {
      // Intentionally ignored: paywall can still be shown with default offerings.
    } finally {
      _isFetchingOfferings = false;
    }
  }

  // Future<void> _handlePremiumBannerTap({required bool isPremium}) async {
  //   if (isPremium) return;

  //   if (_offerings == null) {
  //     await _fetchOfferings();
  //   }

  //   final paywallResult = await RevenueCatUI.presentPaywall(
  //     offering: _offerings?.current,
  //   );

  //   if (paywallResult == PaywallResult.purchased) {
  //     await ref.read(userProfileProvider.notifier).refresh();
  //   }
  // }

  String _getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('MMM d, y').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String _getNotificationIcon(String type) {
    // Map notification types to icons
    return AppIcons.notifications;
  }

  @override
  Widget build(BuildContext context) {
    final notificationHistoryAsync = ref.watch(notificationHistoryProvider);
    final unreadCountAsync = ref.watch(unreadCountProvider);
    final isPremium = ref.watch(
      userProfileProvider.select((data) => data.value?.user.isPremium ?? false),
    );

    return Scaffold(
      body: Stack(
        children: [
          BlurredGradientBackground(),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(
                  context,
                  unreadCount: unreadCountAsync.value ?? 0,
                  hasNotifications:
                      notificationHistoryAsync.value?.isNotEmpty ?? false,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await ref
                          .read(notificationHistoryProvider.notifier)
                          .refresh();
                      ref.invalidate(unreadCountProvider);
                    },
                    child: notificationHistoryAsync.when(
                      data: (notifications) {
                        if (notifications.isEmpty) {
                          return _buildEmptyState();
                        }
                        return _buildNotificationsList(
                          context,
                          notifications,
                          isPremium: isPremium,
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error loading notifications',
                              style: AppTextStyles.body(16),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(notificationHistoryProvider.notifier)
                                    .refresh();
                              },
                              child: const Text('Retry'),
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

  Widget _buildHeader(
    BuildContext context, {
    required int unreadCount,
    required bool hasNotifications,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(AppIcons.backarrow, width: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            t.settingsSupport.notifications,
            style: AppTextStyles.body(
              22,
              weight: FontWeight.w700,
              color: Colors.white,
              height: 30,
            ),
          ),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$unreadCount',
                style: AppTextStyles.body(
                  12,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          const Spacer(),
          PopupMenuButton<String>(
            color: Colors.white,
            elevation: 4,
            offset: const Offset(0, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            icon: SvgPicture.asset(AppIcons.deleteAll, width: 24, height: 24),
            onSelected: (value) async {
              if (value == 'delete_all') {
                await ref
                    .read(notificationHistoryProvider.notifier)
                    .deleteAll();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'delete_all',
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.deleteAll,
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                      height: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      t.delete,
                      style: AppTextStyles.body(
                        14,
                        weight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppIcons.deleteNotification,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  t.notifications.noNotifications,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(
                    22,
                    weight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.05,
                    height: 22,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  t.notifications.noNotificationsSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(
                    16,
                    letterSpacing: -0.05,
                    color: Colors.white,
                    weight: FontWeight.w300,
                    height: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsList(
    BuildContext context,
    List<NotificationHistory> notifications, {
    required bool isPremium,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationsCard(
                  title: notification.title,
                  description: notification.message,
                  time: _getRelativeTime(notification.sentAt),
                  imagePath: _getNotificationIcon(notification.type),
                  isRead: notification.isRead,
                  onTap: () async {
                    if (!notification.isRead) {
                      await ref
                          .read(notificationHistoryProvider.notifier)
                          .markAsRead(notification.id);
                    }
                  },
                  onClose: () async {
                    await ref
                        .read(notificationHistoryProvider.notifier)
                        .deleteNotification(notification.id);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
