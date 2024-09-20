part of 'notification_screen_bloc.dart';

sealed class NotificationScreenEvent extends Equatable {
  const NotificationScreenEvent();
}

class OnLoadNotifications extends NotificationScreenEvent {
  @override
  List<Object?> get props => [];
}
