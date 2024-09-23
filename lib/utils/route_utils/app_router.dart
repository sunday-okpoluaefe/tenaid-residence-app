import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/log.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

Object? _rootWidget;

abstract class AppRouter {
  Future gotoWidget(Widget screen, BuildContext context,
      {bool clearStack = false,
      bool fullScreenDialog = false,
      AnimationType animationType = AnimationType.slideRight,
      Object? root = null}) {
    _rootWidget = root ?? _rootWidget;
    return !clearStack
        ? Navigator.of(context).push(RouteTransition(
            animationType: animationType,
            builder: (context) => screen,
            fullscreenDialog: fullScreenDialog))
        : Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => screen,
                fullscreenDialog: fullScreenDialog),
            (_) => false);
  }

  gotoNamed(String route, BuildContext context,
      {bool clearStack = false, dynamic args = Object, Type? root = null}) {
    _rootWidget = root ?? _rootWidget;
    return !clearStack
        ? Navigator.of(context).pushNamed(route, arguments: args)
        : Navigator.of(context)
            .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);
  }

  void goBack(BuildContext context,
      {bool rootNavigator = false, bool toRoot = false, result}) {
    if (!toRoot) {
      Navigator.of(context, rootNavigator: rootNavigator).pop(result);
    } else if (_rootWidget != null) {
      Log.d(_rootWidget.runtimeType);
      Navigator.popUntil(context, (route) {
        // Check if the route is a MaterialPageRoute
        if (route is MaterialPageRoute) {
          // Compare the pageType with the runtime type of the widget
          return route.settings.name == null &&
              route.builder(context).runtimeType == _rootWidget.runtimeType;
        }
        return false;
      });
    }
  }
}
