import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_join_request_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/entity/join_request_status_param.dart';
import '../../../../library/community/domain/use_cases/set_join_request_status_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'join_request_detail_bloc.g.dart';

part 'join_request_detail_event.dart';

part 'join_request_detail_state.dart';

@injectable
class JoinRequestDetailBloc
    extends AppBloc<JoinRequestDetailEvent, JoinRequestDetailState> {
  final GetJoinRequestUseCase getJoinRequest;
  final SetJoinRequestStatusUseCase setJoinRequestStatus;

  JoinRequestDetailBloc(this.getJoinRequest, this.setJoinRequestStatus)
      : super(JoinRequestDetailState()) {
    on<OnInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        if (event.requestDetail != null) {
          emit(state.copyWith(
              loading: false, requestDetail: event.requestDetail));
        } else {
          JoinRequestDomain request = await getJoinRequest(event.request ?? '');
          emit(state.copyWith(loading: false, requestDetail: request));
        }
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });

    on<OnApproveRequest>((event, emit) async {
      emit(state.copyWith(approving: true));
      try {
        await setJoinRequestStatus(JoinRequestStatusParam(
            request: state.requestDetail?.id ?? '',
            status: 'approved',
            comment: 'Approved'));

        emit(state.copyWith(approving: false, completed: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
