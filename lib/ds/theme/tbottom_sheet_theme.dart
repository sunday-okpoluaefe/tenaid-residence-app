import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData light = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: ColorLight.colorBackground,
      modalBackgroundColor: ColorLight.colorBackground,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

  static BottomSheetThemeData dark = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: ColorLight.colorOnBackground,
      modalBackgroundColor: ColorLight.colorOnBackground,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
