import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/app.dart';
import 'package:tenaid_mobile/feature/core/search_address/search_address_screen.dart';
import 'package:tenaid_mobile/feature/core/select_country/select_country_screen.dart';
import 'package:tenaid_mobile/library/account/domain/entity/country_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

import 'app_router.dart';

@injectable
class BaseNavigator extends AppRouter {
  BuildContext? get context => navigatorKey.currentContext;

  void back({bool rootNavigator = false, result}) =>
      goBack(context!, rootNavigator: false, result: result);

  Future toScreen({
    required Widget screen,
    bool clearStack = false,
    bool fullScreenDialog = false,
    AnimationType animationType = AnimationType.slideRight,
  }) =>
      gotoWidget(screen, context!,
          clearStack: clearStack,
          fullScreenDialog: fullScreenDialog,
          animationType: animationType);

  Future toNamed(
          {required String route,
          bool clearStack = false,
          dynamic args = Object}) =>
      gotoNamed(route, context!, clearStack: clearStack, args: args);

  Future toSelectCountry(Function(CountryDomain) onSelected) => toScreen(
      screen: SelectCountryScreen(onSelected: onSelected),
      animationType: AnimationType.slideUp);

  Future toSearchAddress(Function(PlaceDomain) onSelected) => toScreen(
      screen: SearchAddressScreen(onSelected),
      animationType: AnimationType.slideUp);
}
