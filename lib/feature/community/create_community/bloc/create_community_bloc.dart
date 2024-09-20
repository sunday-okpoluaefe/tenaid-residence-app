import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/app_bloc.dart';

part 'create_community_bloc.g.dart';
part 'create_community_event.dart';
part 'create_community_state.dart';

@injectable
class CreateCommunityBloc
    extends AppBloc<CreateCommunityEvent, CreateCommunityState> {
  CreateCommunityBloc() : super(CreateCommunityState()) {
    on<OnNamedChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<OnDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
  }
}
