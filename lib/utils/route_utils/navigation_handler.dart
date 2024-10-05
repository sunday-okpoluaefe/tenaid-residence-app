import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_navigator.dart';

@injectable
class NavigationHandler {
  final CommunityNavigator communityNavigator;
  final VisitorNavigator visitorNavigator;

  NavigationHandler(this.communityNavigator, this.visitorNavigator);

  void parse({required String route, required String? param}) {
    if (route.startsWith('community'))
      communityNavigator.parse(route: route, param: param);
    else if (route.startsWith('visitor'))
      visitorNavigator.parse(route: route, param: param);
  }
}
