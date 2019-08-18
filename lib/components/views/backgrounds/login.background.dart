import 'package:flutter/material.dart';

final LOGIN_BACKGROUND = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.0, 0.05, 0.1, 0.15, 0.25],
    colors: [
      Colors.red[800],
      Colors.red[600],
      Colors.red[500],
      Colors.red[300],
      Colors.white,
    ],
  ),
);