import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

part 'join_community_screen_bloc.g.dart';
part 'join_community_screen_event.dart';
part 'join_community_screen_state.dart';

@injectable
class JoinCommunityScreenBloc
    extends Bloc<JoinCommunityScreenEvent, JoinCommunityScreenState> {
  void handleUiEvent(JoinCommunityScreenEvent event) => add(event);

  JoinCommunityScreenBloc() : super(JoinCommunityScreenState()) {
    on<OnSearch>((event, emit) {
      emit(state.copyWith(nav: Resettable(ShowSearchScreen())));
    });

    on<OnCommunitySelected>((event, emit) {
      emit(state.copyWith(selected: event.community, validated: true));
    });

    on<OnContinue>((event, emit) {
      emit(state.copyWith(nav: Resettable(ShowStreetScreen(state.selected!))));
    });
  }
}
