import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';

import '../../../library/core/domain/use_cases/get_notifications_usecase.dart';
import '../../../utils/app_bloc.dart';

part 'notification_screen_bloc.g.dart';

part 'notification_screen_event.dart';

part 'notification_screen_state.dart';

@injectable
class NotificationScreenBloc
    extends AppBloc<NotificationScreenEvent, NotificationScreenState> {
  final GetNotificationsUseCase getNotifications;

  NotificationScreenBloc(this.getNotifications)
      : super(NotificationScreenState()) {
    on<OnLoadNotifications>((event, emit) async {
      emit(state.copyWith(loading: true, error: false));

      try {
        List<NotificationDomain> notifications = await getNotifications(true);
        emit(state.copyWith(loading: false, notifications: notifications));
      } catch (_) {
        emit(state.copyWith(loading: false, error: true));
      }
    });
  }
}
