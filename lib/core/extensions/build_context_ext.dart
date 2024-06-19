import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
