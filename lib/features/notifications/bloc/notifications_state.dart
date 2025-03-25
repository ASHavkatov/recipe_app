import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/notifications/notifications_model.dart';

enum NotificationStatus { idle, loading, error, success }

class NotificationsState extends Equatable {
  final List<NotificationsModel> notifications;
  final NotificationStatus? notificationStatus;

  const NotificationsState({
    required this.notifications,
    required this.notificationStatus,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
      notifications: [],
      notificationStatus: NotificationStatus.idle,
    );
  }

  NotificationsState copyWith({
    List<NotificationsModel>? notifications,
    NotificationStatus? notificationsStatus,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationStatus: notificationsStatus ?? this.notificationStatus,
    );
  }

  @override
  List<Object?> get props => [notifications, notificationStatus];
}
