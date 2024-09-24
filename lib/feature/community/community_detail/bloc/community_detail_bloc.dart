import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/set_primary_community_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

import '../../../../utils/app_bloc.dart';

part 'community_detail_bloc.g.dart';
part 'community_detail_event.dart';
part 'community_detail_state.dart';

@injectable
class CommunityDetailBloc
    extends AppBloc<CommunityDetailEvent, CommunityDetailState> {
  final SetPrimaryCommunityUseCase setPrimaryCommunity;

  CommunityDetailBloc(this.setPrimaryCommunity)
      : super(CommunityDetailState()) {
    on<OnInit>((event, emit) {
      emit(state.copyWith(community: event.community));
    });

    on<OnSetPrimaryClicked>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        AccountCommunityDomain community =
            await setPrimaryCommunity(state.community?.community?.id ?? '');

        syncRequiredNotifier.notify();
        emit(state.copyWith(loading: false, community: community));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
