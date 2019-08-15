import 'package:flutter/material.dart';
import 'components/screens/home.screen.dart';
import 'components/screens/login.screen.dart';
import 'components/screens/splash.screen.dart';
import 'utils/theme.dart';

void main() => runApp(PingisApp());

class PingisApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: THEME_LIGHT,
      darkTheme: THEME_DARK,
      home: SplashScreen(),
    );
  }
}
