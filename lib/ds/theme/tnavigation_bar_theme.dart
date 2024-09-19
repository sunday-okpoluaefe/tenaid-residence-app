import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';
import 'package:tenaid_mobile/ds/theme/ttext_theme.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData light = NavigationBarThemeData(
      backgroundColor: ColorLight.colorBackground,
      indicatorColor: ColorLight.colorSecondaryContainer.withOpacity(0.50),
      labelTextStyle: WidgetStateProperty.resolveWith((state) {
        return (state.contains(WidgetState.selected))
            ? TTextTheme.light.labelMedium?.copyWith(
                color: ColorLight.colorSecondary, fontWeight: FontWeight.bold)
            : TTextTheme.light.labelMedium;
      }));

  static NavigationBarThemeData dark = NavigationBarThemeData(
      backgroundColor: ColorLight.colorOnSurface,
      indicatorColor: ColorLight.colorOnSurface,
      labelTextStyle: WidgetStateProperty.resolveWith(
          (state) => TTextTheme.light.labelMedium));
}
