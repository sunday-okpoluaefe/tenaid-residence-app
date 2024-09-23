import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/data/mapper/visitor_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/community/data/model/join_request.dart';
import 'package:tenaid_mobile/library/community/data/model/visitor.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_community_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/pair.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';

import '../../../utils/network.dart';
import '../../../utils/worker.dart';
import '../../core/domain/entity/paginated_result.dart';
import '../domain/entity/account_community_domain.dart';
import 'data_source/community_local_datasource.dart';
import 'data_source/community_remote_datasource.dart';
import 'mapper/account_community_to_domain_mapper.dart';
import 'mapper/community_to_domain_mapper.dart';
import 'mapper/join_request_to_domain_mapper.dart';
import 'mapper/street_to_domain_mapper.dart';

@Injectable(as: CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource _remoteDataSource;
  final CommunityToDomainMapper _communityToDomainMapper;
  final StreetToDomainMapper _streetToDomainMapper;
  final CommunityLocalDataSource _localDataSource;
  final VisitorToDomainMapper visitorToDomainMapper;
  final AccountCommunityToDomainMapper accountCommunityMapper;
  final JoinRequestToDomainMapper joinRequestMapper;

  CommunityRepositoryImpl(
      this._remoteDataSource,
      this._communityToDomainMapper,
      this._streetToDomainMapper,
      this.accountCommunityMapper,
      this._localDataSource,
      this.visitorToDomainMapper,
      this.joinRequestMapper);

  @override
  Future<List<CommunityDomain>> searchCommunity(String query) async {
    return (await _remoteDataSource.searchCommunity(query))
        .map((data) => _communityToDomainMapper.map(data))
        .toList();
  }

  @override
  Future<List<StreetDomain>> getAllCommunityStreets(String community) async {
    return (await _remoteDataSource.streets(community))
        .map((street) => _streetToDomainMapper.map(street)!)
        .toList();
  }

  @override
  Future<AccountCommunityDomain> requestJoin(RequestJoinParam param) async {
    AccountCommunity community = await _remoteDataSource.requestJoin(param);
    _localDataSource.saveAccountCommunity(community);
    return accountCommunityMapper.map(community);
  }

  @override
  Future<List<AccountCommunityDomain>> getAllCommunities(
      {bool refresh = false}) async {
    List<AccountCommunity> communities =
        await _localDataSource.getAllAccountCommunities();

    if (!refresh) {
      if (communities.length > 0)
        return communities
            .map((AccountCommunity community) =>
                accountCommunityMapper.map(community))
            .toList();
    }

    try {
      communities = await _remoteDataSource.getAllCommunities();
    } on ApiException catch (error) {
      if (error is! NetworkError) throw error;
    }

    _localDataSource.saveAllAccountCommunities(communities);
    return communities.map((com) => accountCommunityMapper.map(com)).toList();
  }

  @override
  Future<void> reset() async => await _localDataSource.reset();

  @override
  Future<AccountCommunityDomain?> getPrimaryAccountCommunity() async {
    AccountCommunity? accountCommunity =
        await _localDataSource.getPrimaryAccountCommunity();

    return accountCommunity != null
        ? accountCommunityMapper.map(accountCommunity)
        : null;
  }

  @override
  Future<void> sendInvite({required InviteParam param}) async {
    final Map<String, dynamic> map = Map();
    map['start'] = param.start;
    map['end'] = param.end;
    map['date'] = param.date;
    map['name'] = param.name;
    map['code'] = param.code;
    map['community'] = param.community;
    map['member'] = param.member;
    map['photo'] = param.photo;
    map['reason'] = param.reason;
    map['type'] = param.type;

    if (!(await NetworkUtil.hasConnectivity())) {
      // save for offline
      Visitor visitor = Visitor(
          id: uniqueId(),
          name: param.name,
          photo: param.photo,
          code: param.code,
          date: param.date,
          start: param.start,
          end: param.end,
          reason: param.reason,
          status: 'pending');
      await _localDataSource.saveVisitor(visitor: visitor);

      registerInviteWorker(data: map);
      return;
    }
    try {
      return await _remoteDataSource.sendInvite(map);
    } on ApiException catch (error) {
      if (error is NetworkError) {
        registerInviteWorker(data: map);
      } else
        throw error;
    }
  }

  @override
  Future<PaginatedResult> getAllVisitors(
      {required int page, required int limit}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    if (community == null) return PaginatedResult();

    late PaginatedResult visitors;

    if (await await NetworkUtil.hasConnectivity()) {
      visitors = await _remoteDataSource.getAllVisitors(
          community: community.community!.id!, limit: limit, page: page);

      if (page == 1) {
        _localDataSource.saveVisitors(
            visitors: visitors.data.isEmpty
                ? <Visitor>[]
                : visitors.data as List<Visitor>);
      }
    } else {
      visitors = await _localDataSource.getAllVisitors();
    }

    return visitors.copyWith(
        data: List<VisitorDomain>.from(visitors.data
            .map((visitor) => visitorToDomainMapper.map(visitor as Visitor))));
  }

  @override
  Future<PaginatedResult> getPendingVisitors(
      {required int page, required int limit}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    if (community == null) return PaginatedResult();

    PaginatedResult visitors = await _remoteDataSource.getAllVisitorsByStatus(
        community: community.community!.id!,
        status: 'pending',
        limit: limit,
        page: page);

    return visitors.copyWith(
        data: List<VisitorDomain>.from(visitors.data
            .map((visitor) => visitorToDomainMapper.map(visitor as Visitor))));
  }

  @override
  Future<PaginatedResult> getUpcomingVisitors(
      {required int page, required int limit}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    if (community == null) return PaginatedResult();
    late PaginatedResult visitors;

    if (await await NetworkUtil.hasConnectivity()) {
      visitors = await _remoteDataSource.getUpcomingVisitors(
          community: community.community!.id!, limit: limit, page: page);
    } else {
      visitors =
          await _localDataSource.getUpcomingVisitors(page: page, limit: limit);
    }

    return visitors.copyWith(
        data: List<VisitorDomain>.from(visitors.data
            .map((visitor) => visitorToDomainMapper.map(visitor as Visitor))));
  }

  @override
  Future<PaginatedResult> getRecentVisitors(
      {required int page, required int limit}) async {
    Pair<DateTime, DateTime> range = recent.toUtc();

    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    if (community == null) return PaginatedResult();

    late PaginatedResult visitors;

    if (await await NetworkUtil.hasConnectivity()) {
      visitors = await _remoteDataSource.getAllVisitorsByDate(
          community: community.community!.id!,
          start: range.first.toIso8601String(),
          end: range.second.toIso8601String(),
          limit: limit,
          page: page);
    } else {
      visitors = await _localDataSource.getVisitorsByDate(
          start: range.first, end: range.second, page: page, limit: limit);
    }

    return visitors.copyWith(
        data: List<VisitorDomain>.from(visitors.data
            .map((visitor) => visitorToDomainMapper.map(visitor as Visitor))));
  }

  @override
  Future<PaginatedResult> getTodayVisitors(
      {required int page, required int limit}) async {
    Pair<DateTime, DateTime> range = today.toUtc();

    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    if (community == null) return PaginatedResult();
    late PaginatedResult visitors;

    if (await await NetworkUtil.hasConnectivity()) {
      visitors = await _remoteDataSource.getAllVisitorsByDate(
          community: community.community!.id!,
          start: range.first.toIso8601String(),
          end: range.second.toIso8601String(),
          limit: limit,
          page: page);
    } else {
      visitors = await _localDataSource.getVisitorsByDate(
          start: range.first, end: range.second, page: page, limit: limit);
    }

    return visitors.copyWith(
        data: List<VisitorDomain>.from(visitors.data
            .map((visitor) => visitorToDomainMapper.map(visitor as Visitor))));
  }

  @override
  Future<void> createCommunity({required CreateCommunityParam param}) async =>
      await _remoteDataSource.createCommunity(param);

  @override
  Future<int> joinRequestsCount() async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();

    if (community?.isAdmin != true) return 0;
    return _remoteDataSource.getJoinRequestsCount(
        community: community!.community!.id!);
  }

  @override
  Future<JoinRequestDomain> getCommunityJoinRequest(
      {required String request}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();
    JoinRequest data = await _remoteDataSource.getCommunityJoinRequest(
        community: community!.community!.id!, request: request);

    return joinRequestMapper.map(data);
  }

  @override
  Future<PaginatedResult> getCommunityJoinRequests(
      {required int page, required int limit}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();

    PaginatedResult result = await _remoteDataSource.getCommunityJoinRequests(
        community!.community!.id!,
        page: page,
        limit: limit);

    return result.copyWith(
        data: List<JoinRequestDomain>.from(result.data
            .map((request) => joinRequestMapper.map(request as JoinRequest))));
  }

  @override
  Future<void> setCommunityJoinRequestStatus(
      {required String request,
      required String status,
      required String comment}) async {
    AccountCommunity? community =
        await _localDataSource.getPrimaryAccountCommunity();

    await _remoteDataSource.setCommunityJoinRequestStatus(
        community!.community!.id!,
        request: request,
        status: status,
        comment: comment);
  }
}
