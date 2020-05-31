import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get baseBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get accentColor => Theme.of(this).accentColor;
}
