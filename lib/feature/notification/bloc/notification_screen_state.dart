part of 'notification_screen_bloc.dart';

@CopyWith(skipFields: true)
class NotificationScreenState extends Equatable {
  final bool loading;
  final bool error;
  final List<NotificationDomain> notifications;

  NotificationScreenState(
      {this.loading = false,
      this.notifications = const [],
      this.error = false});

  @override
  List<Object> get props => [loading, notifications, error];
}
