import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';

import '../../../utils/app_bloc.dart';

part 'notification_screen_bloc.g.dart';
part 'notification_screen_event.dart';
part 'notification_screen_state.dart';

@injectable
class NotificationScreenBloc
    extends AppBloc<NotificationScreenEvent, NotificationScreenState> {
  NotificationScreenBloc() : super(NotificationScreenState()) {
    on<NotificationScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
