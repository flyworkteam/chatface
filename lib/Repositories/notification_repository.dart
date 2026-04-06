import 'package:chatface/Models/notification_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/dio_service.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationRepository {
  NotificationRepository(this.ref);
  final Ref ref;

  DioService get _dioService => ref.read(AllProviders.dioServiceProvider);

  // ============================================
  // ============================================
  // Notification Settings
  // ============================================

  /// Get notification settings
  /// GET /api/notifications/settings
  Future<NotificationSettings?> getNotificationSettings() async {
    try {
      final response = await _dioService.get('notifications/settings');
      if (response.data['success'] == true && response.data['data'] != null) {
        return NotificationSettings.fromJson(
          response.data['data'] as Map<String, dynamic>,
        );
      }
      return null;
    } catch (e) {
      Print.error('Error fetching notification settings: $e');
      return null;
    }
  }

  /// Toggle notifications on/off
  /// POST /api/notifications/toggle
  Future<bool> toggleNotifications(bool enabled) async {
    try {
      final response = await _dioService.post(
        'notifications/toggle',
        data: {'enabled': enabled},
      );

      return response.data['success'] == true;
    } catch (e) {
      Print.error('Error toggling notifications: $e');
      rethrow;
    }
  }

  // ============================================
  // Notification History
  // ============================================

  /// Get notification history
  /// GET /api/notifications/history?limit=20
  Future<List<NotificationHistory>> getHistory({int limit = 20}) async {
    try {
      final response = await _dioService.get(
        'notifications/history',
        queryParameters: {'limit': limit},
      );

      if (response.data['success'] == true) {
        final List historyJson = response.data['data'] as List;
        return historyJson
            .map(
              (json) =>
                  NotificationHistory.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      }

      return [];
    } catch (e) {
      Print.error('Error fetching notification history: $e');
      rethrow;
    }
  }

  /// Mark notification as read
  /// PATCH /api/notifications/:id/read
  Future<bool> markAsRead(int notificationId) async {
    try {
      final response = await _dioService.patch(
        'notifications/$notificationId/read',
      );

      return response.data['success'] == true;
    } catch (e) {
      Print.error('Error marking notification as read: $e');
      rethrow;
    }
  }

  /// Mark all notifications as read
  /// PATCH /api/notifications/read-all
  Future<int> markAllAsRead() async {
    try {
      final response = await _dioService.patch('notifications/read-all');

      if (response.data['success'] == true) {
        return response.data['data']['markedCount'] as int? ?? 0;
      }

      return 0;
    } catch (e) {
      Print.error('Error marking all notifications as read: $e');
      rethrow;
    }
  }

  /// Delete single notification
  /// DELETE /api/notifications/:id
  Future<bool> deleteNotification(int notificationId) async {
    try {
      final response = await _dioService.delete(
        'notifications/$notificationId',
      );

      return response.data['success'] == true;
    } catch (e) {
      Print.error('Error deleting notification: $e');
      rethrow;
    }
  }

  /// Delete all notifications
  /// DELETE /api/notifications/all
  Future<int> deleteAllNotifications() async {
    try {
      final response = await _dioService.delete('notifications/all');

      if (response.data['success'] == true) {
        return response.data['data']['deletedCount'] as int? ?? 0;
      }

      return 0;
    } catch (e) {
      Print.error('Error deleting all notifications: $e');
      rethrow;
    }
  }

  /// Get unread notification count
  /// GET /api/notifications/unread-count
  Future<int> getUnreadCount() async {
    try {
      final response = await _dioService.get('notifications/unread-count');

      if (response.data['success'] == true) {
        return response.data['data']['unreadCount'] as int? ?? 0;
      }

      return 0;
    } catch (e) {
      Print.error('Error fetching unread count: $e');
      rethrow;
    }
  }
  // ============================================
  // Test (Development Only)
  // ============================================

  /// Send test notification (development only)
  /// POST /api/notifications/test
  Future<bool> sendTestNotification({String type = 'reminder_4h'}) async {
    try {
      final response = await _dioService.post(
        'notifications/test',
        data: {'type': type},
      );

      return response.data['success'] == true;
    } catch (e) {
      Print.error('Error sending test notification: $e');
      rethrow;
    }
  }
}
