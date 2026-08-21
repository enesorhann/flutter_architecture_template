import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => screenSize.height;
  double get width => screenSize.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double dynamicHeight(double val) => height * val;
  double dynamicWidth(double val) => width * val;
}

extension PaddingExtension on BuildContext {
  double get paddingLow => lowValue;
  double get paddingNormal => normalValue;
  double get paddingMedium => mediumValue;
  double get paddingHigh => highValue;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}
