import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_street_param.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

import '../../../../library/community/domain/use_cases/create_community_street_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'create_community_street_bloc.g.dart';
part 'create_community_street_event.dart';
part 'create_community_street_state.dart';

@injectable
class CreateCommunityStreetBloc
    extends AppBloc<CreateCommunityStreetEvent, CreateCommunityStreetState> {
  final CreateCommunityStreetUseCase createCommunityStreet;

  CreateCommunityStreetBloc(this.createCommunityStreet)
      : super(CreateCommunityStreetState()) {
    on<OnNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<OnDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        await createCommunityStreet(CreateStreetParam(
            community: event.community,
            name: state.name,
            description: state.description));

        syncRequiredNotifier.notify(type: DataSyncType.streets);
        emit(state.copyWith(loading: false, completed: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
