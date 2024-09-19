import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/community/confirm_join/confirm_join_screen.dart';
import 'package:tenaid_mobile/feature/community/join_community/join_community_screen.dart';
import 'package:tenaid_mobile/feature/community/member_address/member_address_screen.dart';
import 'package:tenaid_mobile/feature/community/search_community/search_community_screen.dart';
import 'package:tenaid_mobile/feature/community/select_street/select_street_screen.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

@injectable
class CommunityNavigator extends BaseNavigator {
  static const String join = '/community/join';
  static const String create = '/community/join';
  static const String confirmJoin = '/community/confirm_join';
  static const String memberAddress = '/community/member_address';
  static const String communityAddress = '/community/address';
  static const String confirmCreate = '/community/confirm_join';

  Future toJoinCommunity() => toScreen(screen: JoinCommunityScreen());

  Future toWhereYouLive(CommunityDomain community) =>
      toScreen(screen: MemberAddressScreen(community: community));

  Future toConfirmJoin(
          {required CommunityDomain community,
          required StreetDomain street,
          required String houseNumber,
          required String apartment}) =>
      toScreen(
          screen: ConfirmJoinScreen(
              community: community,
              street: street,
              houseNumber: houseNumber,
              apartment: apartment));

  Future toSelectStreet(String community, Function(StreetDomain) onSelected) =>
      toScreen(
          screen: SelectStreetScreen(
            community: community,
            onSelected: onSelected,
          ),
          animationType: AnimationType.slideUp);

  Future toSearchCommunity(Function(CommunityDomain community) onSelected) =>
      toScreen(
          screen: SearchCommunityScreen(onSelected: onSelected),
          animationType: AnimationType.slideUp);
}
