import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  // Screen Dimensions
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;

  // Padding & Insets
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  // Device Pixel Ratio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  // Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}


extension WidgetSpacing on int {
  SizedBox wSpace(BuildContext context) {
    assert(this >= 0);
    return SizedBox(width: this * MediaQuery.of(context).size.width / 100);
  }

  SizedBox hSpace(BuildContext context) {
    assert(this >= 0);
    return SizedBox(height: this * MediaQuery.of(context).size.height / 100);
  }
}
