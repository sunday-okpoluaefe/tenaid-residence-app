import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/ttext_theme.dart';

class TDatePickerTheme {
  static DatePickerThemeData light = DatePickerThemeData(
      headerHelpStyle: TTextTheme.light.titleLarge,
      headerHeadlineStyle: TTextTheme.light.headlineMedium);

  static DatePickerThemeData dark =
      DatePickerThemeData(headerHelpStyle: TTextTheme.light.titleLarge);
}
