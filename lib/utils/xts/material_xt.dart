import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextXt on BuildContext {
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  ThemeData get theme => Theme.of(this);

  TextTheme get text => theme.textTheme;

  ColorScheme get color => theme.colorScheme;

  AppLocalizations get locale => AppLocalizations.of(this)!;
}

extension TextStyleXt on TextStyle {
  TextStyle fade(BuildContext context) =>
      copyWith(color: context.color.onSurfaceVariant.withOpacity(0.7));
}
