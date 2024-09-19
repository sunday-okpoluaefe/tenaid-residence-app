import 'package:flutter/material.dart';

import 'tapp_color.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme light = TextTheme(
      bodyLarge: const TextStyle()
          .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
      bodyMedium: const TextStyle()
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500),
      bodySmall: const TextStyle()
          .copyWith(fontSize: 14.0, fontWeight: FontWeight.w400),
      labelSmall: const TextStyle()
          .copyWith(fontSize: 12.0, fontWeight: FontWeight.w400),
      labelMedium: const TextStyle()
          .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
      labelLarge: const TextStyle()
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
      titleSmall: const TextStyle()
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.normal),
      titleMedium: const TextStyle()
          .copyWith(fontSize: 18.0, fontWeight: FontWeight.w500),
      titleLarge: const TextStyle()
          .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineSmall: const TextStyle()
          .copyWith(fontSize: 24.0, fontWeight: FontWeight.w600),
      headlineMedium: const TextStyle()
          .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
      headlineLarge: const TextStyle()
          .copyWith(fontSize: 48.0, fontWeight: FontWeight.w700));

  static TextTheme dark = TextTheme(
      bodyLarge: const TextStyle()
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
      bodyMedium: const TextStyle()
          .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
      bodySmall: const TextStyle()
          .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
      labelMedium: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: ColorLight.colorOnBackground.withOpacity(0.70)),
      labelLarge: const TextStyle()
          .copyWith(fontSize: 12.0, fontWeight: FontWeight.normal),
      titleSmall: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: ColorLight.colorOnBackground.withOpacity(0.70)),
      titleMedium: const TextStyle()
          .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
      titleLarge: const TextStyle()
          .copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
      headlineSmall: const TextStyle()
          .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
      headlineMedium: const TextStyle()
          .copyWith(fontSize: 24.0, fontWeight: FontWeight.w600),
      headlineLarge: const TextStyle()
          .copyWith(fontSize: 32.0, fontWeight: FontWeight.w700));
}
