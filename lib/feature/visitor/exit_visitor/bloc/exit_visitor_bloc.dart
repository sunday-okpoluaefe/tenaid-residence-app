import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/totp.dart';

import '../../../../library/community/domain/entity/account_community_domain.dart';
import '../../../../library/community/domain/entity/invite_domain.dart';
import '../../../../library/community/domain/entity/invite_param.dart';
import '../../../../library/community/domain/use_cases/get_primary_account_community_usecase.dart';
import '../../../../library/community/domain/use_cases/send_invite_usecase.dart';
import '../../../../utils/app_bloc.dart';
import '../../invite_visitor/bloc/invite_visitor_screen_bloc.dart';

part 'exit_visitor_bloc.g.dart';
part 'exit_visitor_event.dart';
part 'exit_visitor_state.dart';

@injectable
class ExitVisitorBloc extends AppBloc<ExitVisitorEvent, ExitVisitorState> {
  final SendInviteUseCase sendInvite;
  final TOTP totp;
  final GetPrimaryAccountCommunityUseCase getPrimaryAccountCommunity;

  ExitVisitorBloc(this.sendInvite, this.getPrimaryAccountCommunity, this.totp)
      : super(ExitVisitorState()) {
    on<OnNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<OnPurposeChanged>((event, emit) {
      emit(state.copyWith(purpose: event.purpose));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        AccountCommunityDomain? community =
            await getPrimaryAccountCommunity(true);
        if (community != null) {
          String secret = '${community.community?.id}${community.id}';

          String exitCode = await totp.generateExitCode(
              secret: secret, code: community.code ?? '');

          DateTime start = DateTime.now().toUtc();
          DateTime end = DateTime.now().add(Duration(minutes: 45)).toUtc();

          InviteParam param = InviteParam(
              date: start.toIso8601String(),
              end: end.toIso8601String(),
              member: community.id!,
              community: community.community!.id!,
              startDate: start,
              endDate: end,
              name: state.name.trim(),
              photo: "",
              code: exitCode,
              start: start.toIso8601String(),
              exitOnly: true,
              reason: state.purpose.isEmpty ? "Personal" : state.purpose,
              type: InviteType.single.name);

          await sendInvite(param);

          InviteDomain invite = InviteDomain(
              community: community,
              code: param.code!,
              exitOnly: param.exitOnly,
              type: InviteType.single,
              name: param.name!.trim(),
              purpose: param.reason!.trim(),
              startDate: param.startDate!,
              endDate: param.endDate!,
              status: 'pending');

          emit(state.copyWith(
              loading: false, showDetailsScreen: Resettable(invite)));
        }
      } catch (_) {
        emit(state.copyWith(loading: false));
      }
    });
  }
}
