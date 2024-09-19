import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme light = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: ColorLight.colorSurface,
      surfaceTintColor: ColorLight.colorSurface,
      iconTheme: IconThemeData(color: ColorLight.colorOnBackground, size: 24.0),
      actionsIconTheme:
          IconThemeData(color: ColorLight.colorOnBackground, size: 24.0));

  static AppBarTheme dark = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: ColorLight.colorBackground, size: 24.0),
      actionsIconTheme:
          IconThemeData(color: ColorLight.colorBackground, size: 24.0));
}
