part of 'dashboard_screen_bloc.dart';

@CopyWith(skipFields: true)
class DashboardScreenState extends Equatable {
  final bool loading;
  final int joinRequests;
  final bool accountLoading;
  final bool todayVisitorsLoading;
  final bool recentVisitorsLoading;
  final bool communitiesLoading;
  final AccountDomain? account;
  final List<VisitorDomain> todayVisitors;
  final List<VisitorDomain> recentVisitors;
  final List<AccountCommunityDomain>? communities;
  final AccountCommunityDomain? pendingJoin;
  final AccountCommunityDomain? pendingCreate;

  DashboardScreenState(
      {this.loading = false,
      this.joinRequests = 0,
      this.todayVisitors = const [],
      this.recentVisitors = const [],
      this.recentVisitorsLoading = false,
      this.todayVisitorsLoading = false,
      this.accountLoading = false,
      this.communitiesLoading = false,
      this.account,
      this.communities,
      this.pendingJoin,
      this.pendingCreate});

  @override
  List<Object?> get props => [
        loading,
        account,
        communities,
        pendingJoin,
        recentVisitors,
        joinRequests,
        todayVisitors,
        pendingCreate,
        communitiesLoading,
        recentVisitorsLoading,
        accountLoading,
        todayVisitorsLoading
      ];
}
