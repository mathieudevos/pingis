import 'package:flutter/material.dart';

final THEME_LIGHT = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color: Colors.red[800]),
  textTheme: TextTheme(
    headline: TextStyle(
      fontSize: 72.0,
      fontStyle: FontStyle.normal,
      color: Colors.grey[850],
      fontFamily: 'Lobster',
    ),
    title: TextStyle(
      color: Colors.grey[850],
      fontFamily: 'Montserrate',
      fontSize: 18.0,
      letterSpacing: 0.6,
    ),
    subtitle: TextStyle(
      color: Colors.grey[850],
      fontFamily: 'Montserrate',
      fontSize: 12.0,
    ),
    body1: TextStyle(
      fontSize: 11.0,
      fontFamily: 'Montserrat',
    ),
  ),
  buttonColor: Colors.grey[100],
  primaryColor: Colors.grey[850],
);

final THEME_DARK = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(color: Colors.amber[700])
);

final GRADIENT_COLORS = [
  Colors.amber[400],
  Colors.red[300],
];