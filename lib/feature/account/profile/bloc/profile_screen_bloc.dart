import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/logout_usecase.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_all_communities_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../utils/app_bloc.dart';

part 'profile_screen_bloc.g.dart';
part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

@injectable
class ProfileScreenBloc
    extends AppBloc<ProfileScreenEvent, ProfileScreenState> {
  final GetAccountUseCase getAccount;
  final LogoutUseCase logout;
  final GetAllCommunitiesUseCase getAllCommunities;

  ProfileScreenBloc(this.getAccount, this.getAllCommunities, this.logout)
      : super(ProfileScreenState()) {
    on<OnFetchProfile>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        AccountDomain account = await getAccount(false);
        emit(state.copyWith(account: account, loading: false));

        List<AccountCommunityDomain> communities =
            await getAllCommunities(false);
        emit(state.copyWith(communities: communities));
      } catch (_) {}
    });

    on<OnLogout>((event, emit) async {
      emit(state.copyWith(isLoggingOut: true));
      try {
        await logout(true);
        emit(state.copyWith(isLoggingOut: false, showLogin: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(isLoggingOut: false, error: Resettable(error)));
      }
    });
  }
}
