import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingis/components/screens/home.screen.dart';
import 'package:pingis/components/screens/auth.screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => AuthScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            )
          )
        );
    }
  }
}