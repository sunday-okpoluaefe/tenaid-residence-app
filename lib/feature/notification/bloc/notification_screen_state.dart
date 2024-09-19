part of 'notification_screen_bloc.dart';

@CopyWith(skipFields: true)
class NotificationScreenState extends Equatable {
  final bool loading;
  final List<NotificationDomain> notifications;

  NotificationScreenState(
      {this.loading = false, this.notifications = const []});

  @override
  List<Object> get props => [loading, notifications];
}
