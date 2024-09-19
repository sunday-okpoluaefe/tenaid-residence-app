import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/use_cases/request_join_usecase.dart';

part 'confirm_join_screen_bloc.g.dart';
part 'confirm_join_screen_event.dart';
part 'confirm_join_screen_state.dart';

@injectable
class ConfirmJoinScreenBloc
    extends Bloc<ConfirmJoinScreenEvent, ConfirmJoinScreenState> {
  late CommunityDomain _community;
  late StreetDomain _street;
  late String _houseNumber;
  late String _apartment;

  final RequestJoinUseCase requestJoin;

  void init(
      {required CommunityDomain community,
      required StreetDomain street,
      required String houseNumber,
      required String apartment}) {
    _community = community;
    _street = street;
    _apartment = apartment;
    _houseNumber = houseNumber;
  }

  void handleUiEvent(ConfirmJoinScreenEvent event) => add(event);

  ConfirmJoinScreenBloc(this.requestJoin) : super(ConfirmJoinScreenState()) {
    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        AccountCommunityDomain communityDomain = await requestJoin(
            RequestJoinParam(
                street: _street.id!,
                isPrimary: state.isPrimary,
                community: _community.id!,
                houseNumber: _houseNumber,
                apartment: _apartment));

        emit(state.copyWith(
            loading: false, success: Resettable(communityDomain)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });

    on<OnPrimaryChanged>((event, emit) {
      emit(state.copyWith(isPrimary: event.checked));
    });
  }
}
