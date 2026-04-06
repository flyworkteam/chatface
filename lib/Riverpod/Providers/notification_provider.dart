import 'package:chatface/Models/notification_model.dart';
import 'package:chatface/Repositories/notification_repository.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ============================================
// Repository Provider
// ============================================

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref);
});

// ============================================
// Notification Settings Provider
// ============================================

class NotificationSettingsNotifier
    extends AsyncNotifier<NotificationSettings?> {
  NotificationRepository get _repository =>
      ref.read(notificationRepositoryProvider);

  @override
  Future<NotificationSettings?> build() async {
    return _fetchSettings();
  }

  Future<NotificationSettings?> _fetchSettings() async {
    try {
      return await _repository.getNotificationSettings();
    } catch (e) {
      Print.error('Error loading notification settings: $e');
      return null;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchSettings());
  }

  Future<bool> toggleNotifications(bool enabled) async {
    try {
      final success = await _repository.toggleNotifications(enabled);
      if (success) {
        await refresh();
      }
      return success;
    } catch (e) {
      Print.error('Error toggling notifications: $e');
      return false;
    }
  }
}

final notificationSettingsProvider =
    AsyncNotifierProvider<NotificationSettingsNotifier, NotificationSettings?>(
      () => NotificationSettingsNotifier(),
    );

// ============================================
// Notification History Provider
// ============================================

class NotificationHistoryNotifier
    extends AsyncNotifier<List<NotificationHistory>> {
  NotificationRepository get _repository =>
      ref.read(notificationRepositoryProvider);

  @override
  Future<List<NotificationHistory>> build() async {
    return await _fetchHistory();
  }

  Future<List<NotificationHistory>> _fetchHistory() async {
    try {
      final history = await _repository.getHistory(limit: 50);
      return history;
    } catch (e) {
      Print.error('Error loading notification history: $e');
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchHistory());
  }

  Future<bool> markAsRead(int notificationId) async {
    try {
      final success = await _repository.markAsRead(notificationId);
      if (success) {
        // Update local state
        final currentState = state.value ?? [];
        state = AsyncValue.data(
          currentState.map((n) {
            if (n.id == notificationId) {
              return n.copyWith(isRead: true, readAt: DateTime.now());
            }
            return n;
          }).toList(),
        );

        // Invalidate unread count
        ref.invalidate(unreadCountProvider);
      }
      return success;
    } catch (e) {
      Print.error('Error marking notification as read: $e');
      return false;
    }
  }

  Future<bool> markAllAsRead() async {
    try {
      final count = await _repository.markAllAsRead();
      Print.info('Marked all as read, count: $count');

      // Always refresh history and unread count to ensure UI is in sync
      await refresh();
      ref.invalidate(unreadCountProvider);

      return true;
    } catch (e) {
      Print.error('Error marking all as read: $e');
      return false;
    }
  }

  Future<bool> deleteNotification(int notificationId) async {
    try {
      final success = await _repository.deleteNotification(notificationId);
      if (success) {
        // Remove from local state
        final currentState = state.value ?? [];
        state = AsyncValue.data(
          currentState.where((n) => n.id != notificationId).toList(),
        );

        // Invalidate unread count
        ref.invalidate(unreadCountProvider);
      }
      return success;
    } catch (e) {
      Print.error('Error deleting notification: $e');
      return false;
    }
  }

  Future<bool> deleteAll() async {
    try {
      final count = await _repository.deleteAllNotifications();
      Print.info('Deleted all, count: $count');

      // Always clear local state if the request succeeded
      state = const AsyncValue.data([]);
      ref.invalidate(unreadCountProvider);

      return true;
    } catch (e) {
      Print.error('Error deleting all notifications: $e');
      return false;
    }
  }
}

final notificationHistoryProvider =
    AsyncNotifierProvider<
      NotificationHistoryNotifier,
      List<NotificationHistory>
    >(() => NotificationHistoryNotifier());

// ============================================
// Unread Count Provider
// ============================================

final unreadCountProvider = FutureProvider<int>((ref) async {
  final repository = ref.read(notificationRepositoryProvider);
  try {
    return await repository.getUnreadCount();
  } catch (e) {
    Print.error('Error fetching unread count: $e');
    return 0;
  }
});
