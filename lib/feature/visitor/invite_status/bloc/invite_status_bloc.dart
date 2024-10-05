import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/pair.dart';

import '../../../../library/community/domain/use_cases/get_primary_account_community_usecase.dart';
import '../../../../library/community/domain/use_cases/update_exit_code_usecase.dart';
import '../../../../utils/app_bloc.dart';
import '../../../../utils/resettable.dart';
import '../../../../utils/totp.dart';

part 'invite_status_bloc.g.dart';
part 'invite_status_event.dart';
part 'invite_status_state.dart';

@injectable
class InviteStatusBloc extends AppBloc<InviteStatusEvent, InviteStatusState> {
  final UpdateExitCodeUseCase updateExitCode;
  final TOTP totp;
  final GetPrimaryAccountCommunityUseCase getPrimaryAccountCommunity;

  InviteStatusBloc(
      this.updateExitCode, this.totp, this.getPrimaryAccountCommunity)
      : super(InviteStatusState()) {
    on<OnInit>((event, emit) {
      emit(state.copyWith(visitor: event.visitor));
    });

    on<OnGenerateExitCode>((event, emit) async {
      emit(state.copyWith(loading: true));
      // try {
      //   AccountCommunityDomain? community =
      //       await getPrimaryAccountCommunity(true);
      //   if (community != null) {
      //     String secret = '${community.community?.id}${community.id}';
      //     String exitCode = await totp.generateExitCode(
      //         secret: secret, code: community.code ?? '');
      //   }
      // } catch (_) {
      //   emit(state.copyWith(loading: false));
      // }
    });
  }
}
