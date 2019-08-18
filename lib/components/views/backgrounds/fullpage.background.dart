import 'package:flutter/material.dart';

final FULLPAGE_BACKGROUND = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.1, 0.3, 0.5, 0.7],
    colors: [
      Colors.red[800],
      Colors.red[600],
      Colors.red[500],
      Colors.red[300],
    ],
  ),
);