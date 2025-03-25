import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/notifications_repository.dart';

import 'notifications_state.dart';
part'notifications_event.dart';
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required NotificationsRepository repo})
      : _repo = repo,
        super(
          NotificationsState.initial(),
        ) {
    on<NotificationsLoading>(_onLoad);
    add(NotificationsLoading());
  }
  final NotificationsRepository _repo;

  Future<void> _onLoad(NotificationsEvent event, Emitter<NotificationsState> emit) async {
    emit(
      state.copyWith(
        notificationsStatus: NotificationStatus.loading,
      ),
    );
    final notifications = await _repo.fetchNotifications();
    emit(
      state.copyWith(notifications: notifications, notificationsStatus: NotificationStatus.success),
    );
  }
}
