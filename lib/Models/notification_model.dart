/// Notification Settings Model
class NotificationSettings {
  final bool notificationsEnabled;
  final String reminderInterval;
  final bool quietHoursEnabled;
  final String? quietHoursStart;
  final String? quietHoursEnd;
  final String? timezone;
  final DateTime? lastNotificationAt;

  NotificationSettings({
    required this.notificationsEnabled,
    required this.reminderInterval,
    required this.quietHoursEnabled,
    this.quietHoursStart,
    this.quietHoursEnd,
    this.timezone,
    this.lastNotificationAt,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? false,
      reminderInterval: json['reminderInterval'] as String? ?? 'off',
      quietHoursEnabled: json['quietHoursEnabled'] as bool? ?? false,
      quietHoursStart: json['quietHoursStart'] as String?,
      quietHoursEnd: json['quietHoursEnd'] as String?,
      timezone: json['timezone'] as String?,
      lastNotificationAt: json['lastNotificationAt'] != null
          ? DateTime.tryParse(json['lastNotificationAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationsEnabled': notificationsEnabled,
      'reminderInterval': reminderInterval,
      'quietHoursEnabled': quietHoursEnabled,
      'quietHoursStart': quietHoursStart,
      'quietHoursEnd': quietHoursEnd,
      'timezone': timezone,
      'lastNotificationAt': lastNotificationAt?.toIso8601String(),
    };
  }

  NotificationSettings copyWith({
    bool? notificationsEnabled,
    String? reminderInterval,
    bool? quietHoursEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
    String? timezone,
    DateTime? lastNotificationAt,
  }) {
    return NotificationSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      reminderInterval: reminderInterval ?? this.reminderInterval,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      timezone: timezone ?? this.timezone,
      lastNotificationAt: lastNotificationAt ?? this.lastNotificationAt,
    );
  }
}

/// Notification History Item
class NotificationHistory {
  final int id;
  final String type;
  final String title;
  final String message;
  final String status;
  final bool isRead;
  final DateTime? readAt;
  final DateTime sentAt;

  NotificationHistory({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.status,
    required this.isRead,
    this.readAt,
    required this.sentAt,
  });

  factory NotificationHistory.fromJson(Map<String, dynamic> json) {
    return NotificationHistory(
      id: json['id'] as int,
      type: json['type'] as String? ?? 'reminder',
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      status: json['status'] as String? ?? 'sent',
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] != null
          ? DateTime.tryParse(json['readAt'] as String)
          : null,
      sentAt: DateTime.parse(json['sentAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'message': message,
      'status': status,
      'isRead': isRead,
      'readAt': readAt?.toIso8601String(),
      'sentAt': sentAt.toIso8601String(),
    };
  }

  NotificationHistory copyWith({
    int? id,
    String? type,
    String? title,
    String? message,
    String? status,
    bool? isRead,
    DateTime? readAt,
    DateTime? sentAt,
  }) {
    return NotificationHistory(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      isRead: isRead ?? this.isRead,
      readAt: readAt ?? this.readAt,
      sentAt: sentAt ?? this.sentAt,
    );
  }
}

/// Notification Interval Option
class NotificationInterval {
  final String value;
  final int hours;
  final String? tone;
  final Map<String, String> name;
  final Map<String, String> description;

  NotificationInterval({
    required this.value,
    required this.hours,
    this.tone,
    required this.name,
    required this.description,
  });

  factory NotificationInterval.fromJson(Map<String, dynamic> json) {
    return NotificationInterval(
      value: json['value'] as String,
      hours: json['hours'] as int,
      tone: json['tone'] as String?,
      name: Map<String, String>.from(json['name'] as Map),
      description: Map<String, String>.from(json['description'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'hours': hours,
      'tone': tone,
      'name': name,
      'description': description,
    };
  }
}
