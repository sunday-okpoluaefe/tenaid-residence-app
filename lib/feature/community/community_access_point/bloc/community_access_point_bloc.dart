import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';

import '../../../../library/community/domain/use_cases/get_community_access_points_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'community_access_point_bloc.g.dart';
part 'community_access_point_event.dart';
part 'community_access_point_state.dart';

@injectable
class CommunityAccessPointBloc
    extends AppBloc<CommunityAccessPointEvent, CommunityAccessPointState> {
  final GetCommunityAccessPointsUseCase getCommunityAccessPoints;

  CommunityAccessPointBloc(this.getCommunityAccessPoints)
      : super(CommunityAccessPointState()) {
    on<OnLoadAccessPoints>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        List<AccessPointDomain> result = await getCommunityAccessPoints(true);
        emit(state.copyWith(accessPoints: result, loading: false));
      } on ApiException catch (_) {
        emit(state.copyWith(loading: false, error: true));
      }
    });
  }
}
