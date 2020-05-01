import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get screenHeight {
    final mediaQuery = dependOnInheritedWidgetOfExactType<MediaQuery>();
    return mediaQuery.data.size.height;
  }

  double get screenWidth {
    final mediaQuery = dependOnInheritedWidgetOfExactType<MediaQuery>();
    return mediaQuery.data.size.width;
  }
}
