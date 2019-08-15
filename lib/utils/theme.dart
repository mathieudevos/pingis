import 'package:flutter/material.dart';

final THEME_LIGHT = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color: Colors.red[800]),
  textTheme: TextTheme(
    headline: TextStyle(
      fontSize: 72.0,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontFamily: 'Lobster',
    ),
    title: TextStyle(
      fontSize: 32.0,
      // fontStyle: FontStyle.italic,
      color: Colors.white,
      fontFamily: 'Lobster'
    ),
    body1: TextStyle(
      fontSize: 11.0,
      fontFamily: 'Montserrat',
    ),
  ),
  buttonColor: Colors.grey[100],
);

final THEME_DARK = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(color: Colors.amber[700])
);