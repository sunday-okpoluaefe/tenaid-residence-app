import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';

@injectable
class NavigationHandler {
  final CommunityNavigator communityNavigator;

  NavigationHandler({required this.communityNavigator});

  void parse({required String route, required Map<String, dynamic> param}) {
    if (route.startsWith('community'))
      communityNavigator.parse(route: route, param: param);
  }
}
