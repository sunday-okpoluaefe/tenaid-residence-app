// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// DashboardScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardScreenState call({
    bool? loading,
    int? joinRequests,
    AccountCommunityDomain? primaryCommunity,
    List<VisitorDomain>? todayVisitors,
    List<VisitorDomain>? recentVisitors,
    bool? recentVisitorsLoading,
    bool? todayVisitorsLoading,
    bool? accountLoading,
    bool? communitiesLoading,
    AccountDomain? account,
    List<AccountCommunityDomain>? communities,
    AccountCommunityDomain? pendingJoin,
    AccountCommunityDomain? pendingCreate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardScreenState.copyWith(...)`.
class _$DashboardScreenStateCWProxyImpl
    implements _$DashboardScreenStateCWProxy {
  const _$DashboardScreenStateCWProxyImpl(this._value);

  final DashboardScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// DashboardScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? joinRequests = const $CopyWithPlaceholder(),
    Object? primaryCommunity = const $CopyWithPlaceholder(),
    Object? todayVisitors = const $CopyWithPlaceholder(),
    Object? recentVisitors = const $CopyWithPlaceholder(),
    Object? recentVisitorsLoading = const $CopyWithPlaceholder(),
    Object? todayVisitorsLoading = const $CopyWithPlaceholder(),
    Object? accountLoading = const $CopyWithPlaceholder(),
    Object? communitiesLoading = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? communities = const $CopyWithPlaceholder(),
    Object? pendingJoin = const $CopyWithPlaceholder(),
    Object? pendingCreate = const $CopyWithPlaceholder(),
  }) {
    return DashboardScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      joinRequests:
          joinRequests == const $CopyWithPlaceholder() || joinRequests == null
              ? _value.joinRequests
              // ignore: cast_nullable_to_non_nullable
              : joinRequests as int,
      primaryCommunity: primaryCommunity == const $CopyWithPlaceholder()
          ? _value.primaryCommunity
          // ignore: cast_nullable_to_non_nullable
          : primaryCommunity as AccountCommunityDomain?,
      todayVisitors:
          todayVisitors == const $CopyWithPlaceholder() || todayVisitors == null
              ? _value.todayVisitors
              // ignore: cast_nullable_to_non_nullable
              : todayVisitors as List<VisitorDomain>,
      recentVisitors: recentVisitors == const $CopyWithPlaceholder() ||
              recentVisitors == null
          ? _value.recentVisitors
          // ignore: cast_nullable_to_non_nullable
          : recentVisitors as List<VisitorDomain>,
      recentVisitorsLoading:
          recentVisitorsLoading == const $CopyWithPlaceholder() ||
                  recentVisitorsLoading == null
              ? _value.recentVisitorsLoading
              // ignore: cast_nullable_to_non_nullable
              : recentVisitorsLoading as bool,
      todayVisitorsLoading:
          todayVisitorsLoading == const $CopyWithPlaceholder() ||
                  todayVisitorsLoading == null
              ? _value.todayVisitorsLoading
              // ignore: cast_nullable_to_non_nullable
              : todayVisitorsLoading as bool,
      accountLoading: accountLoading == const $CopyWithPlaceholder() ||
              accountLoading == null
          ? _value.accountLoading
          // ignore: cast_nullable_to_non_nullable
          : accountLoading as bool,
      communitiesLoading: communitiesLoading == const $CopyWithPlaceholder() ||
              communitiesLoading == null
          ? _value.communitiesLoading
          // ignore: cast_nullable_to_non_nullable
          : communitiesLoading as bool,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as AccountDomain?,
      communities: communities == const $CopyWithPlaceholder()
          ? _value.communities
          // ignore: cast_nullable_to_non_nullable
          : communities as List<AccountCommunityDomain>?,
      pendingJoin: pendingJoin == const $CopyWithPlaceholder()
          ? _value.pendingJoin
          // ignore: cast_nullable_to_non_nullable
          : pendingJoin as AccountCommunityDomain?,
      pendingCreate: pendingCreate == const $CopyWithPlaceholder()
          ? _value.pendingCreate
          // ignore: cast_nullable_to_non_nullable
          : pendingCreate as AccountCommunityDomain?,
    );
  }
}

extension $DashboardScreenStateCopyWith on DashboardScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardScreenStateCWProxy get copyWith =>
      _$DashboardScreenStateCWProxyImpl(this);
}
