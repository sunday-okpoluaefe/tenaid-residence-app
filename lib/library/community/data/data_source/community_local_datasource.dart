import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';
import 'package:tenaid_mobile/utils/pair.dart';
import 'package:tenaid_mobile/utils/xts/list_xt.dart';
import 'package:tenaid_mobile/utils/xts/visitor_xts.dart';

import '../../../core/domain/entity/paginated_result.dart';
import '../model/visitor.dart';

late LazyBox CommunityBox;
late LazyBox VisitorBox;

@injectable
class CommunityLocalDataSource {
  final Cache cache;

  CommunityLocalDataSource({required this.cache});

  Future<void> saveAccountCommunity(AccountCommunity community) async {
    await CommunityBox.put(community.id ?? "", jsonEncode(community.toJson()));
  }

  Future<void> savePrimaryAccountCommunity(AccountCommunity community) async {
    await cache.set(
        PREF_PRIMARY_ACCOUNT_COMMUNITY, jsonEncode(community.toJson()));
  }

  Future<AccountCommunity?> getPrimaryAccountCommunity() async {
    String json = await cache.getString(PREF_PRIMARY_ACCOUNT_COMMUNITY, "");
    if (json.isEmpty) return null;
    return AccountCommunity.fromJson(jsonDecode(json));
  }

  Future<void> saveVisitor({required Visitor visitor}) async {
    await VisitorBox.put(visitor.id, jsonEncode(visitor.toJson()));
  }

  Future<List<Visitor>> _getAllVisitors() async {
    int length = await VisitorBox.length;
    List<Visitor> visitors = [];

    for (int i = 0; i < length; i++) {
      Visitor? visitor = await getVisitorAtIndex(index: i);
      if (visitor != null) visitors.add(visitor);
    }

    return visitors;
  }

  Future<PaginatedResult> getAllVisitors({int page = 1, int limit = 10}) async {
    List<Visitor> visitors = await _getAllVisitors();

    return await visitors.paged(page: page, limit: limit);
  }

  Future<PaginatedResult> getVisitorsByDate(
      {required DateTime start,
      required DateTime end,
      int page = 1,
      int limit = 10}) async {
    List<Visitor> visitors = await _getAllVisitors();

    return visitors
        .visitorsByDate(dates: Pair(first: start, second: end))
        .paged(page: page, limit: limit);
  }

  Future<PaginatedResult> getUpcomingVisitors(
      {int page = 1, int limit = 10}) async {
    List<Visitor> visitors = await _getAllVisitors();

    return visitors.upcomingVisitors().paged(page: page, limit: limit);
  }

  Future<Visitor?> getVisitorAtIndex({required int index}) async {
    if (index >= await VisitorBox.length) return null;

    String json = await VisitorBox.getAt(index);
    return json.isEmpty ? null : Visitor.fromJson(jsonDecode(json));
  }

  Future<Visitor?> getVisitor({required String id}) async {
    String json = await VisitorBox.get(id, defaultValue: "");
    return json.isEmpty ? null : Visitor.fromJson(jsonDecode(json));
  }

  Future<void> saveVisitors({required List<Visitor> visitors}) async {
    await VisitorBox.clear();
    for (Visitor visitor in visitors) {
      saveVisitor(visitor: visitor);
    }
  }

  Future<void> saveAllAccountCommunities(
      List<AccountCommunity> communities) async {
    await CommunityBox.clear();
    for (AccountCommunity community in communities)
      await saveAccountCommunity(community);

    AccountCommunity? active = communities.active;
    if (active != null) savePrimaryAccountCommunity(active);
  }

  Future<AccountCommunity?> getAccountCommunity(String id) async {
    String json = await CommunityBox.get(id, defaultValue: "");
    return json.isEmpty ? null : AccountCommunity.fromJson(jsonDecode(json));
  }

  Future<AccountCommunity?> getAccountCommunityAtIndex(int index) async {
    if (index >= await CommunityBox.length) return null;
    String? json = await CommunityBox.getAt(index);
    return json != null && json.isNotEmpty
        ? AccountCommunity.fromJson(jsonDecode(json))
        : null;
  }

  Future<List<AccountCommunity>> getAllAccountCommunities() async {
    int length = await CommunityBox.length;
    List<AccountCommunity> communities = [];

    for (int i = 0; i < length; i++) {
      AccountCommunity? community = await getAccountCommunityAtIndex(i);
      if (community != null) communities.add(community);
    }
    return communities;
  }

  Future<void> reset() async => await CommunityBox.clear();
}
