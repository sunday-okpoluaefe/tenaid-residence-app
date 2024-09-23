import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/app_bloc.dart';

part 'community_detail_event.dart';
part 'community_detail_state.dart';

@injectable
class CommunityDetailBloc
    extends AppBloc<CommunityDetailEvent, CommunityDetailState> {
  CommunityDetailBloc() : super(CommunityDetailInitial()) {
    on<CommunityDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
