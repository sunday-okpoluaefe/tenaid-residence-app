part of 'profile_screen_bloc.dart';

@CopyWith(skipFields: true)
class ProfileScreenState extends Equatable {
  final bool loading;
  final bool isLoggingOut;
  final Resettable<bool>? showLogin;
  final Resettable<ApiException>? error;
  final AccountDomain? account;
  final List<AccountCommunityDomain>? communities;
  final AccountCommunityDomain? activeCommunity;

  ProfileScreenState(
      {this.loading = false,
      this.isLoggingOut = false,
      this.showLogin,
      this.account,
      this.error,
      this.communities,
      this.activeCommunity});

  @override
  List<Object?> get props => [
        showLogin,
        error,
        isLoggingOut,
        account,
        communities,
        activeCommunity,
        loading
      ];
}
