part of 'dashboard_screen_bloc.dart';

sealed class DashboardScreenEvent extends Equatable {
  final bool refresh;
  final bool silent;

  const DashboardScreenEvent({required this.refresh, required this.silent});
}

class OnGetAccount extends DashboardScreenEvent {
  OnGetAccount({required bool refresh, required bool silent})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [refresh, silent];
}

class OnGetCommunities extends DashboardScreenEvent {
  OnGetCommunities({required bool refresh, required bool silent})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [refresh, silent];
}

class OnPageSelected extends DashboardScreenEvent {
  final int page;

  OnPageSelected(this.page, {required bool refresh, required bool silent})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [page, refresh, silent];
}

class OnGetTodayVisitors extends DashboardScreenEvent {
  OnGetTodayVisitors({required bool refresh, required bool silent})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [refresh, silent];
}

class OnGetRecentVisitors extends DashboardScreenEvent {
  OnGetRecentVisitors({required bool refresh, required bool silent})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [refresh, silent];
}

class OnGetRequestsCount extends DashboardScreenEvent {
  OnGetRequestsCount({bool refresh = false, bool silent = true})
      : super(refresh: refresh, silent: silent);

  @override
  List<Object?> get props => [];
}
