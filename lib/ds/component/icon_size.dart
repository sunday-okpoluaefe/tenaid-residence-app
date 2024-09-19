class IconSize {
  final double width;
  final double height;

  IconSize._internal(this.width, this.height);

  static IconSize extraLargeProfile = IconSize._internal(96, 96);
  static IconSize largeProfile = IconSize._internal(82, 82);
  static IconSize mediumProfile = IconSize._internal(76, 76);
  static IconSize extraExtraLarge = IconSize._internal(64, 64);
  static IconSize extraLarge = IconSize._internal(48, 48);
  static IconSize large = IconSize._internal(32, 32);
  static IconSize medium = IconSize._internal(24, 24);
  static IconSize small = IconSize._internal(12, 12);
}
