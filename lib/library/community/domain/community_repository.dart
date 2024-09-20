import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';

import '../../base/domain/base_repository.dart';
import '../../core/domain/entity/paginated_result.dart';
import 'entity/account_community_domain.dart';
import 'entity/create_community_param.dart';

abstract class CommunityRepository extends BaseRepository {
  Future<List<CommunityDomain>> searchCommunity(String query);

  Future<List<StreetDomain>> getAllCommunityStreets(String community);

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

  Future<void> createCommunity({required CreateCommunityParam param});
}
