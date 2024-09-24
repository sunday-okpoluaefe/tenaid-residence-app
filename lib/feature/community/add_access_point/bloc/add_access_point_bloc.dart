import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_access_point_param.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/create_access_point_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

import '../../../../utils/app_bloc.dart';

part 'add_access_point_bloc.g.dart';
part 'add_access_point_event.dart';
part 'add_access_point_state.dart';

@injectable
class AddAccessPointBloc
    extends AppBloc<AddAccessPointEvent, AddAccessPointState> {
  final CreateAccessPointUseCase createAccessPoint;

  AddAccessPointBloc(this.createAccessPoint) : super(AddAccessPointState()) {
    on<OnNamedChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<OnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<OnDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        await createAccessPoint(CreateAccessPointParam(
            name: state.name,
            description: state.description,
            password: state.password));

        syncRequiredNotifier.notify();
        emit(state.copyWith(loading: false, completed: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
