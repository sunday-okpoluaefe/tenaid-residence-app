import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  // light theme
  static final light = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorLight.colorBackground,
          backgroundColor: ColorLight.colorPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: ColorLight.colorSurface)));

  // dark theme
  static final dark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorLight.colorBackground,
          backgroundColor: ColorLight.colorOnBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: ColorLight.colorSurface)));
}
