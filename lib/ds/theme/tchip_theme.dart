import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData light = ChipThemeData(
      disabledColor: ColorLight.colorOnSurfaceVariant,
      labelStyle: TextStyle(color: ColorLight.colorBackground),
      selectedColor: ColorLight.colorPrimary,
      checkmarkColor: ColorLight.colorSurface,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0));

  static ChipThemeData dark = ChipThemeData(
      disabledColor: ColorLight.colorOnSurfaceVariant,
      labelStyle: TextStyle(color: ColorLight.colorBackground),
      selectedColor: ColorLight.colorOnBackground,
      checkmarkColor: ColorLight.colorSurface,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0));
}
