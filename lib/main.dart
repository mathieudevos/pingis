import 'package:flutter/material.dart';
import 'components/screens/home.screen.dart';
// import 'package:pingis/components/screens/login.dart';
import 'components/screens/splash.screen.dart';

void main() => runApp(PingisApp());

class PingisApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: Colors.amber[700])
      ),
      home: SplashScreen(),
      routes: {
        '/home': (_) => HomeScreen(),
        '/splash': (_) => SplashScreen(),
        // '/login': (_) => new LoginScreen(),
      }
    );
  }
}
