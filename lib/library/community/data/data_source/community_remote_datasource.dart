import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/network_response.dart';
import 'package:tenaid_mobile/library/community/data/model/access_point.dart';
import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/community/data/model/community.dart';
import 'package:tenaid_mobile/library/community/data/model/join_request.dart';
import 'package:tenaid_mobile/library/community/data/model/street.dart';
import 'package:tenaid_mobile/library/community/data/model/visitor.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_access_point_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_community_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/library/core/data/model/address.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';

import '../../../../core/network/api.dart';

@injectable
class CommunityRemoteDataSource {
  final Api api;

  CommunityRemoteDataSource({required this.api});

  Future<List<Community>> searchCommunity(String query) async {
    final body = <String, dynamic>{};
    body['query'] = query;

    NetworkResponse response = await api(
        url: 'community/search', requestType: RequestType.get, params: body);

    return List<Community>.from(
        response.data['docs'].map((data) => Community.fromJson(data)));
  }

  Future<PaginatedResult> streets(
      {required String community, int page = 1, int limit = 10}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;

    NetworkResponse response = await api(
        url: 'community/$community/path',
        requestType: RequestType.get,
        params: map);

    PaginatedResult result = PaginatedResult.parse(response.data);

    return result.copyWith(
        data: List<Street>.from(
            response.data['docs'].map((data) => Street.fromJson(data))));
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

    PaginatedResult pagedResult = PaginatedResult.parse(response.data);

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

    PaginatedResult pagedResult = PaginatedResult.parse(response.data);

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

    PaginatedResult pagedResult = PaginatedResult.parse(response.data);

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

    PaginatedResult pagedResult = PaginatedResult.parse(response.data);

    return pagedResult.copyWith(
      data: List<Visitor>.from(
          response.data['docs'].map((data) => Visitor.fromJson(data))),
    );
  }

  Future<int> getJoinRequestsCount({required String community}) async {
    NetworkResponse response = await api(
        url: 'community/$community/join-request-count',
        requestType: RequestType.get);

    return response.data['count'];
  }

  // create a community
  Future<void> createCommunity(CreateCommunityParam param) async {
    Address address = Address(
        address: param.address?.address,
        city: param.address?.city,
        country: param.address?.country,
        proofOfAddress: param.images.firstOrNull,
        latitude: param.address?.latitude,
        postalCode: '1234',
        longitude: param.address?.longitude);

    Map<String, dynamic> map = Map();
    map['name'] = param.name;
    map['description'] = param.description;
    map['type'] = param.type;
    map['images'] = param.images;
    map['address'] = address.toJson();

    await api(url: 'community', body: map, requestType: RequestType.post);
  }

  Future<PaginatedResult> getCommunityJoinRequests(String community,
      {required int page, required int limit}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;

    NetworkResponse response = await api(
        url: 'community/$community/request',
        params: map,
        requestType: RequestType.get);

    PaginatedResult pagedResult = PaginatedResult.parse(response.data);

    return pagedResult.copyWith(
      data: List<JoinRequest>.from(
          response.data['docs'].map((data) => JoinRequest.fromJson(data))),
    );
  }

  Future<JoinRequest> getCommunityJoinRequest(
      {required String community, required String request}) async {
    NetworkResponse response = await api(
        url: 'community/$community/request/$request',
        requestType: RequestType.get);

    return JoinRequest.fromJson(response.data);
  }

  Future<List<AccessPoint>> getCommunityAccessPoints(
      {required String community}) async {
    NetworkResponse response = await api(
        url: 'community/$community/access-point', requestType: RequestType.get);

    return List<AccessPoint>.from(
        response.data.map((json) => AccessPoint.fromJson(json)));
  }

  Future<AccessPoint> createCommunityAccessPoint(
      {required CreateAccessPointParam param,
      required String community}) async {
    Map<String, dynamic> map = Map();
    map['name'] = param.name;
    map['description'] = param.description;
    map['password'] = param.password;

    NetworkResponse response = await api(
        url: 'community/$community/access-point',
        requestType: RequestType.post,
        body: map);

    return AccessPoint.fromJson(response.data);
  }

  Future<void> setCommunityJoinRequestStatus(String community,
      {required String request,
      required String status,
      required String comment}) async {
    Map<String, dynamic> map = Map();
    map['community'] = community;
    map['request'] = request;
    map['status'] = status;
    map['comment'] = comment;

    await api(
        url: 'community/request/status',
        body: map,
        requestType: RequestType.post);
  }

  Future<AccountCommunity> setPrimaryCommunity(String community) async {
    NetworkResponse response = await api(
        url: 'community/$community/primary-access-point',
        requestType: RequestType.post);

    return AccountCommunity.fromJson(response.data);
  }
}
