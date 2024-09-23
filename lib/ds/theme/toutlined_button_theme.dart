import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TOutlinedButtonTheme {
  // light theme
  static final light = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorLight.colorSecondary,
          backgroundColor: ColorLight.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: ColorLight.colorSecondary)));

  // dark theme
  static final dark = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorLight.colorSecondary,
          backgroundColor: ColorLight.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: ColorLight.colorSurface)));
}
