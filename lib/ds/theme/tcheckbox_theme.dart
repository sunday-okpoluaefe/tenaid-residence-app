import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData light = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      return (state.contains(WidgetState.selected))
          ? ColorLight.colorSurface
          : ColorLight.colorOnBackground;
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      return (state.contains(WidgetState.selected))
          ? ColorLight.colorPrimary
          : Colors.transparent;
    }),
  );

  static CheckboxThemeData dark = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      return (state.contains(WidgetState.selected))
          ? ColorLight.colorSurface
          : ColorLight.colorOnBackground;
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      return (state.contains(WidgetState.selected))
          ? ColorLight.colorPrimary
          : Colors.transparent;
    }),
  );
}
