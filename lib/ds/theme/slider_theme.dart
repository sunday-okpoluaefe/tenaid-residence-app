import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/theme/tapp_color.dart';

class TSliderTheme {
  static SliderThemeData light = SliderThemeData(
      trackHeight: Spacing.extraSmall,
      inactiveTrackColor: ColorLight.colorSurfaceContainer);

  static SliderThemeData dark =
      SliderThemeData(trackHeight: Spacing.extraSmall);
}
