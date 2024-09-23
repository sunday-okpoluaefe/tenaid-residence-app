import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_status_param.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../../library/community/domain/use_cases/set_join_request_status_usecase.dart';
import '../../../../../utils/app_bloc.dart';

part 'confirm_decline_join_request_bloc.g.dart';
part 'confirm_decline_join_request_event.dart';
part 'confirm_decline_join_request_state.dart';

@injectable
class ConfirmDeclineJoinRequestBloc extends AppBloc<
    ConfirmDeclineJoinRequestEvent, ConfirmDeclineJoinRequestState> {
  final SetJoinRequestStatusUseCase setJoinRequestStatus;

  ConfirmDeclineJoinRequestBloc(this.setJoinRequestStatus)
      : super(ConfirmDeclineJoinRequestState()) {
    on<OnDeclineRequest>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        await setJoinRequestStatus(JoinRequestStatusParam(
            request: event.request, status: 'denied', comment: state.reason));

        emit(state.copyWith(loading: false, completed: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });

    on<OnReasonChanged>((event, emit) {
      emit(state.copyWith(reason: event.reason));
    });
  }
}
