import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/network_response.dart';
import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/community/data/model/community.dart';
import 'package:tenaid_mobile/library/community/data/model/street.dart';
import 'package:tenaid_mobile/library/community/data/model/visitor.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';

import '../../../../core/network/api.dart';

@injectable
class CommunityRemoteDataSource {
  final Api api;

  CommunityRemoteDataSource({required this.api});

  PaginatedResult _pagedResult(dynamic json) => PaginatedResult(
      totalItems: json['totalItems'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      nextPage: json['currentPage'] + 1,
      itemsPerPage: json['itemsPerPage']);

  Future<List<Community>> searchCommunity(String query) async {
    final body = <String, dynamic>{};
    body['query'] = query;

    NetworkResponse response = await api(
        url: 'community/search', requestType: RequestType.get, params: body);

    return List<Community>.from(
        response.data['docs'].map((data) => Community.fromJson(data)));
  }

  Future<List<Street>> streets(String community) async {
    NetworkResponse response = await api(
        url: 'community/$community/path', requestType: RequestType.get);

    return List<Street>.from(
        response.data.map((data) => Street.fromJson(data)));
  }

  Future<AccountCommunity> requestJoin(RequestJoinParam param) async {
    final body = <String, dynamic>{};
    body['community'] = param.community;
    body['path'] = param.street;
    body['point'] = param.houseNumber;
    body['isPrimary'] = param.isPrimary;
    body['description'] = param.apartment;

    NetworkResponse response = await api(
        url: 'community/join', body: body, requestType: RequestType.post);

    return AccountCommunity.fromJson(response.data);
  }

  Future<List<AccountCommunity>> getAllCommunities() async {
    NetworkResponse response =
        await api(url: 'account/community', requestType: RequestType.get);

    return List<AccountCommunity>.from(response.data['docs']
        .map((community) => AccountCommunity.fromJson(community)));
  }

  Future<void> sendInvite(Map<String, dynamic> data) async {
    await api(
        url: 'community/invite', body: data, requestType: RequestType.post);
  }

  Future<PaginatedResult> getAllVisitors(
      {required String community, int page = 1, int limit = 10}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;

    NetworkResponse response = await api(
        url: 'community/$community/member/invite',
        params: map,
        requestType: RequestType.get);

    PaginatedResult pagedResult = _pagedResult(response.data);

    return pagedResult.copyWith(
      data: List<Visitor>.from(
          response.data['docs'].map((data) => Visitor.fromJson(data))),
    );
  }

  Future<PaginatedResult> getAllVisitorsByStatus(
      {required String community,
      required String status,
      int page = 1,
      int limit = 10}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;
    map['status'] = status;

    NetworkResponse response = await api(
        url: 'community/$community/member/invite-status',
        params: map,
        requestType: RequestType.get);

    PaginatedResult pagedResult = _pagedResult(response.data);

    return pagedResult.copyWith(
      data: List<Visitor>.from(
          response.data['docs'].map((data) => Visitor.fromJson(data))),
    );
  }

  Future<PaginatedResult> getAllVisitorsByDate(
      {required String community,
      required String start,
      required String end,
      int page = 1,
      int limit = 10}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;
    map['start'] = start;
    map['end'] = end;

    NetworkResponse response = await api(
        url: 'community/$community/member/invite-date',
        params: map,
        requestType: RequestType.get);

    PaginatedResult pagedResult = _pagedResult(response.data);

    return pagedResult.copyWith(
      data: List<Visitor>.from(
          response.data['docs'].map((data) => Visitor.fromJson(data))),
    );
  }

  Future<PaginatedResult> getUpcomingVisitors(
      {required String community, int page = 1, int limit = 10}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;

    NetworkResponse response = await api(
        url: 'community/$community/member/invite-upcoming',
        params: map,
        requestType: RequestType.get);

    PaginatedResult pagedResult = _pagedResult(response.data);

    return pagedResult.copyWith(
      data: List<Visitor>.from(
          response.data['docs'].map((data) => Visitor.fromJson(data))),
    );
  }
}
