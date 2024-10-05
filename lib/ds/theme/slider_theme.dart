import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TSliderTheme {
  static SliderThemeData light = SliderThemeData(
      trackHeight: Spacing.extraSmall_h,
      inactiveTrackColor: ColorLight.colorSurfaceContainer);

  static SliderThemeData dark =
      SliderThemeData(trackHeight: Spacing.extraSmall_h);
}
