import 'package:flutter/material.dart';
import 'package:pingis/components/screens/home.dart';
import 'components/screens/intro.dart';

void main() => runApp(PingisApp());

class PingisApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(color: Colors.redAccent),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          title: TextStyle(fontSize: 32.0, fontStyle: FontStyle.italic, color: Colors.white),
          body1: TextStyle(fontSize: 14.0),
        ),
        buttonColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: Colors.amber[700])
      ),
      home: IntroScreen(),
      routes: {
        '/home': (_) => new HomeScreen(),
      }
    );
  }
}
