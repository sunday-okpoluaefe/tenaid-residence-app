import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/visitor/invite_visitor/invite_visitor_screen.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

import '../../library/community/domain/entity/invite_domain.dart';
import 'invite_details/invite_details_screen.dart';

@injectable
class VisitorNavigator extends BaseNavigator {
  Future toInvite() => toScreen(screen: InviteVisitorScreen());

  Future toInviteDetails(InviteDomain invite) => toScreen(
      screen: InviteDetailsScreen(invite: invite),
      animationType: AnimationType.slideUp);

  @override
  Future parse({required String route, Map<String, dynamic>? param}) {
    // TODO: implement parse
    throw UnimplementedError();
  }
}
