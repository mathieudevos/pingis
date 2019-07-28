import 'package:flutter/material.dart';
import 'package:pingis/utils/constants.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.red[800],
              Colors.red[600],
              Colors.red[500],
              Colors.red[300],
            ],
          ),
        ),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 5,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 100),
                Container(padding: const EdgeInsets.all(12.0), child: Text(title, style: Theme.of(context).textTheme.headline))
              ]),
            ),
            Flexible(
              flex: 1,
              child: GoogleSignInButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false),
                borderRadius: 8,
              ),
            ),
          ],
        )),
      )
    );
  }
}