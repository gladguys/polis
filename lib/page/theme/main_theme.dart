import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primaryColor: Colors.amber,
  primaryColorLight: Colors.amber[200],
  primaryColorDark: Colors.amber[800],
  accentColor: Colors.grey[850],
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
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.grey[50],
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'Philosopher',
        fontSize: 30,
        color: Colors.black,
      ),
    ),
  ),
  fontFamily: 'Ubuntu',
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.amber[800]),
    filled: true,
    fillColor: Colors.grey[200],
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.amber[600],
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.amber[600],
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.amber[600],
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red[600],
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.red[600],
      ),
    ),
  ),
);
