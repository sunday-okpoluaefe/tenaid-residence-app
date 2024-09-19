import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_domain.dart';

import '../../../../utils/app_bloc.dart';

part 'invite_details_screen_bloc.g.dart';
part 'invite_details_screen_event.dart';
part 'invite_details_screen_state.dart';

@injectable
class InviteDetailsScreenBloc
    extends AppBloc<InviteDetailsScreenEvent, InviteDetailsScreenState> {
  InviteDetailsScreenBloc() : super(InviteDetailsScreenState()) {
    on<OnInit>((event, emit) {
      emit(state.copyWith(invite: event.invite, loading: false));
    });
  }
}
