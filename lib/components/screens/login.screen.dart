import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:pingis/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.175, 0.2, 0.25],
            colors: [
              Colors.red[700],
              Colors.red[500],
              Colors.red[300],
              Colors.grey[200],
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 100),
                      Container(padding: const EdgeInsets.all(12.0), child: Text(title, style: Theme.of(context).textTheme.headline))
                    ]
                  ),
                ),
                GoogleSignInButton(
                  borderRadius: 5,
                  darkMode: false,
                ),
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Created by Mathieu Devos', style: TextStyle(fontSize: 9, color: Colors.red[100]))
              ),
            ),
          ]
        ),
      )
    );
  }
}