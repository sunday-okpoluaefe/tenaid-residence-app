import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/app.dart';
import 'package:tenaid_mobile/feature/core/search_address/search_address_screen.dart';
import 'package:tenaid_mobile/feature/core/select_country/select_country_screen.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/country_utils/models/city.dart';
import 'package:tenaid_mobile/utils/route_utils/route_transition.dart';

import '../../feature/core/select_city/select_city_screen.dart';
import '../country_utils/models/country.dart';
import 'app_router.dart';

@injectable
class BaseNavigator extends AppRouter {
  BuildContext? get context => navigatorKey.currentContext;

  void back({bool rootNavigator = false, result, bool toRoot = false}) =>
      goBack(context!, rootNavigator: false, result: result, toRoot: toRoot);

  Future toScreen(
          {required Widget screen,
          bool clearStack = false,
          bool fullScreenDialog = false,
          AnimationType animationType = AnimationType.slideRight,
          Object? root}) =>
      gotoWidget(screen, context!,
          clearStack: clearStack,
          root: root,
          fullScreenDialog: fullScreenDialog,
          animationType: animationType);

  Future toNamed(
          {required String route,
          bool clearStack = false,
          Type? root,
          dynamic args = Object}) =>
      gotoNamed(route, context!,
          clearStack: clearStack, args: args, root: root);

  Future toSelectCountry(Function(Country) onSelected) => toScreen(
      screen: SelectCountryScreen(onSelected: onSelected),
      animationType: AnimationType.slideUp);

  Future toSearchAddress(Function(PlaceDomain) onSelected) => toScreen(
      screen: SearchAddressScreen(onSelected),
      animationType: AnimationType.slideUp);

  Future toSelectCity(
          {required Function(City) onSelected, required Country country}) =>
      toScreen(
          screen: SelectCityScreen(
            country: country,
            onSelected: onSelected,
          ),
          animationType: AnimationType.slideUp);
}
