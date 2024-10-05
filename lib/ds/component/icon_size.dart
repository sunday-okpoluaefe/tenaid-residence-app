import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconSize {
  final double width;
  final double height;

  IconSize._internal(this.width, this.height);

  static IconSize extraLargeProfile = IconSize._internal(96.h, 96.h);
  static IconSize largeProfile = IconSize._internal(82.h, 82.h);
  static IconSize mediumProfile = IconSize._internal(76.h, 76.h);
  static IconSize extraExtraLarge = IconSize._internal(64.h, 64.h);
  static IconSize extraLarge = IconSize._internal(48.h, 48.h);
  static IconSize large = IconSize._internal(32.h, 32.h);
  static IconSize medium = IconSize._internal(24.h, 24.h);
  static IconSize small = IconSize._internal(12.h, 12.h);
}
