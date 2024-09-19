import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';
import 'package:tenaid_mobile/ds/theme/ttext_theme.dart';

class TTimePickerTheme {
  static TimePickerThemeData light = TimePickerThemeData(
      backgroundColor: ColorLight.colorBackground,
      dayPeriodColor: ColorLight.colorSecondary,
      dialTextColor: ColorLight.colorSecondary,
      helpTextStyle: TTextTheme.light.titleLarge,
      hourMinuteTextColor: ColorLight.colorSecondary,
      hourMinuteColor: ColorLight.colorSurfaceContainer,
      dialBackgroundColor: ColorLight.colorSurfaceContainer);

  static TimePickerThemeData dark = TimePickerThemeData(
      backgroundColor: ColorLight.colorBackground,
      dialBackgroundColor: ColorLight.colorSurfaceContainer);
}
