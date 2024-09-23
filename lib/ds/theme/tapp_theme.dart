import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/datepicker_theme.dart';
import 'package:tenaid_mobile/ds/theme/slider_theme.dart';
import 'package:tenaid_mobile/ds/theme/tapp_bar_theme.dart';
import 'package:tenaid_mobile/ds/theme/tcheckbox_theme.dart';
import 'package:tenaid_mobile/ds/theme/tchip_theme.dart';
import 'package:tenaid_mobile/ds/theme/timepicker_theme.dart';
import 'package:tenaid_mobile/ds/theme/tnavigation_bar_theme.dart';
import 'package:tenaid_mobile/ds/theme/toutlined_button_theme.dart';
import 'package:tenaid_mobile/ds/theme/ttext_theme.dart';

import 'elevated_button_theme.dart';
import 'tapp_color.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData light = ThemeData(
      useMaterial3: true,
      fontFamily: 'Outfit',
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorLight.colorBackground,
      colorScheme: ColorScheme.light(
          primary: ColorLight.colorPrimary,
          surface: ColorLight.colorSurface,
          error: ColorLight.colorError,
          surfaceBright: ColorLight.colorVariantBright,
          primaryContainer: ColorLight.colorOnPrimaryContainer,
          secondaryContainer: ColorLight.colorSecondaryContainer,
          secondary: ColorLight.colorSecondary,
          secondaryFixed: ColorLight.colorSecondaryFixed,
          onSurface: ColorLight.colorOnBackground,
          surfaceContainerLow: ColorLight.colorOnSurfaceContainer,
          onSecondary: ColorLight.colorOnSecondary,
          primaryFixed: ColorLight.colorSuccess,
          surfaceTint: ColorLight.colorSurfaceTint,
          surfaceContainerHighest: ColorLight.colorOnSurfaceVariant,
          surfaceContainer: ColorLight.colorSurfaceContainer),
      textTheme: TTextTheme.light,
      sliderTheme: TSliderTheme.light,
      outlinedButtonTheme: TOutlinedButtonTheme.light,
      datePickerTheme: TDatePickerTheme.light,
      timePickerTheme: TTimePickerTheme.light,
      navigationBarTheme: TNavigationBarTheme.light,
      checkboxTheme: TCheckboxTheme.light,
      appBarTheme: TAppBarTheme.light,
      chipTheme: TChipTheme.light,
      elevatedButtonTheme: TElevatedButtonTheme.light);

  static ThemeData dark = ThemeData(
      useMaterial3: true,
      fontFamily: 'Outfit',
      brightness: Brightness.dark,
      primaryColor: ColorLight.colorOnBackground,
      scaffoldBackgroundColor: ColorLight.colorBackground,
      textTheme: TTextTheme.dark,
      outlinedButtonTheme: TOutlinedButtonTheme.dark,
      checkboxTheme: TCheckboxTheme.dark,
      navigationBarTheme: TNavigationBarTheme.dark,
      chipTheme: TChipTheme.dark,
      appBarTheme: TAppBarTheme.dark,
      elevatedButtonTheme: TElevatedButtonTheme.dark);
}
