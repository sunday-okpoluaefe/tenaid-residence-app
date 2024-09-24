import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/ds/component/message_bottom_sheet.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/community/community_detail/community_detail_screen.dart';
import 'package:tenaid_mobile/feature/community/confirm_join/confirm_join_screen.dart';
import 'package:tenaid_mobile/feature/community/join_community/join_community_screen.dart';
import 'package:tenaid_mobile/feature/community/member_address/member_address_screen.dart';
import 'package:tenaid_mobile/feature/community/pending_join_request/pending_join_request_screen.dart';
import 'package:tenaid_mobile/feature/community/search_community/search_community_screen.dart';
import 'package:tenaid_mobile/feature/community/select_street/select_street_screen.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../library/community/domain/entity/account_community_domain.dart';
import '../../library/community/domain/entity/create_community_param.dart';
import 'add_access_point/add_access_point_screen.dart';
import 'community_access_point/community_access_point_screen.dart';
import 'community_address/community_address_screen.dart';
import 'community_image/community_image_screen.dart';
import 'community_street/community_street_screen.dart';
import 'confirm_create/confirm_create_screen.dart';
import 'create_community/create_community_screen.dart';
import 'join_request_detail/confirm_decline_join_request/confirm_decline_join_request_screen.dart';
import 'join_request_detail/join_request_detail_screen.dart';
import 'list_community/list_community_screen.dart';

@injectable
class CommunityNavigator extends BaseNavigator {
  static const String join = '/community/join';
  static const String create = '/community/join';
  static const String confirmJoin = '/community/confirm_join';
  static const String memberAddress = '/community/member_address';
  static const String communityAddress = '/community/address';
  static const String confirmCreate = '/community/confirm_join';

  final GetAccountUseCase getAccount;
  final AccountNavigator accountNavigator;

  CommunityNavigator(this.getAccount, this.accountNavigator);

  Future toJoinCommunity({Object? root}) async {
    AccountDomain account = await getAccount(false);
    if (account.kyc?.profileCompleted == true)
      toScreen(screen: JoinCommunityScreen(), root: root);
    else {
      if (context == null) return;
      MessageBottomSheet(
          title: context!.locale.complete_profile,
          message: context!.locale.complete_profile_body,
          primaryButtonText: context!.locale.button_ok,
          primaryButtonClicked: () => accountNavigator.toEditProfile(),
          onDismiss: () => accountNavigator.toEditProfile()).show(context!);
    }
  }

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

  Future toCommunityImage({required CreateCommunityParam param}) => toScreen(
          screen: CommunityImageScreen(
        param: param,
      ));

  Future toSearchCommunity(Function(CommunityDomain community) onSelected) =>
      toScreen(
          screen: SearchCommunityScreen(onSelected: onSelected),
          animationType: AnimationType.slideUp);

  Future toCreateCommunity({Object? root}) =>
      toScreen(screen: CreateCommunityScreen(), root: root);

  Future toCommunityAddress({required CreateCommunityParam param}) => toScreen(
          screen: CommunityAddressScreen(
        param: param,
      ));

  Future toCommunityConfirmCreate({required CreateCommunityParam param}) =>
      toScreen(
          screen: ConfirmCreateScreen(
        param: param,
      ));

  Future toPendingJoinRequests() =>
      toScreen(screen: PendingJoinRequestScreen());

  Future toConfirmRequestDecline({required JoinRequestDomain request}) =>
      toScreen(screen: ConfirmDeclineJoinRequestScreen(request));

  Future toJoinRequestDetails(
          {JoinRequestDomain? request, String? requestId, Object? root}) =>
      toScreen(
          screen: JoinRequestDetailScreen(
            request: request,
            requestId: requestId,
          ),
          root: root,
          animationType: AnimationType.slideUp);

  Future toCommunities() => toScreen(screen: ListCommunityScreen());

  Future toAddAccessPoint() => toScreen(screen: AddAccessPointScreen());

  Future toCommunityStreets({required String community}) =>
      toScreen(screen: CommunityStreetScreen(community: community));

  Future toCommunityDetail({required AccountCommunityDomain community}) =>
      toScreen(screen: CommunityDetailScreen(community: community));

  Future toCommunityAccessPointScreen() =>
      toScreen(screen: CommunityAccessPointScreen());

  Future<void> parse(
      {required String route, required Map<String, dynamic> param}) async {
    switch (route) {
      case 'community/join-request':
        toJoinRequestDetails(requestId: param['request']);
        return;
    }
  }
}
