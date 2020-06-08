import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primaryColor: Colors.amber,
  primaryColorLight: Colors.amber[200],
  primaryColorDark: Colors.amber[800],
  accentColor: Colors.grey[850],
  errorColor: Colors.red[900],
  cursorColor: Colors.amber[600],
  scaffoldBackgroundColor: Colors.grey[50],
  textSelectionColor: Colors.amber[300],
  textSelectionHandleColor: Colors.amber[600],
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.black,
    splashColor: Colors.black38,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.grey[50],
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontFamily: 'Philosopher',
        fontSize: 30,
        color: Colors.black,
      ),
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.grey[50],
  ),
  fontFamily: 'Ubuntu',
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(
        color: Colors.grey[850],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(
        color: Colors.grey[850],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      gapPadding: 2,
      borderSide: const BorderSide(
        width: 2,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(
        color: Colors.red[600],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(
        width: 2,
        color: Colors.red[600],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey[850],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    showDuration: const Duration(seconds: 5),
    preferBelow: false,
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.8),
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
