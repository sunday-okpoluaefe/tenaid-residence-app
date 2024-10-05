import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/visitor/exit_visitor/exit_visitor_screen.dart';
import 'package:tenaid_mobile/feature/visitor/invite_visitor/invite_visitor_screen.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_detail/visitor_detail_screen.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

import '../../library/community/domain/entity/invite_domain.dart';
import 'invite_details/invite_details_screen.dart';

@injectable
class VisitorNavigator extends BaseNavigator {
  Future toInvite() => toScreen(screen: InviteVisitorScreen());

  Future toExit() => toScreen(screen: ExitVisitorScreen());

  Future toInviteDetails(InviteDomain invite) => toScreen(
      screen: InviteDetailsScreen(invite: invite),
      animationType: AnimationType.slideUp);

  Future toVisitorDetail({required String invite}) => toScreen(
          screen: VisitorDetailScreen(
        invite: invite,
      ));

  Future parse({required String route, String? param}) async {
    switch (route) {
      case 'visitor/check-inout':
        toVisitorDetail(invite: param ?? '');
        return;
    }
  }
}
