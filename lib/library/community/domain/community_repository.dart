import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';

import '../../base/domain/base_repository.dart';
import '../../core/domain/entity/paginated_result.dart';
import 'entity/account_community_domain.dart';
import 'entity/create_access_point_param.dart';
import 'entity/create_community_param.dart';

abstract class CommunityRepository extends BaseRepository {
  Future<List<CommunityDomain>> searchCommunity(String query);

  Future<PaginatedResult> getAllCommunityStreets(
      {required String community, int page = 1, int limit = 10});

  Future<AccountCommunityDomain> requestJoin(RequestJoinParam param);

  Future<AccountCommunityDomain?> getPrimaryAccountCommunity();

  Future<void> sendInvite({required InviteParam param});

  Future<PaginatedResult> getTodayVisitors(
      {required int page, required int limit});

  Future<PaginatedResult> getRecentVisitors(
      {required int page, required int limit});

  Future<PaginatedResult> getUpcomingVisitors(
      {required int page, required int limit});

  Future<PaginatedResult> getPendingVisitors(
      {required int page, required int limit});

  Future<PaginatedResult> getAllVisitors(
      {required int page, required int limit});

  Future<List<AccountCommunityDomain>> getAllCommunities(
      {bool refresh = false});

  Future<int> joinRequestsCount();

  Future<void> createCommunity({required CreateCommunityParam param});

  Future<PaginatedResult> getCommunityJoinRequests(
      {required int page, required int limit});

  Future<JoinRequestDomain> getCommunityJoinRequest({required String request});

  Future<List<AccessPointDomain>> getCommunityAccessPoints();

  Future<AccessPointDomain> createCommunityAccessPoints(
      {required CreateAccessPointParam param});

  Future<AccountCommunityDomain> setPrimaryCommunity(String community);

  Future<void> setCommunityJoinRequestStatus(
      {required String request,
      required String status,
      required String comment});
}
