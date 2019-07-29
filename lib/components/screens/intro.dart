import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:pingis/auth/google.auth.dart';
import 'package:pingis/models/user.model.dart';
import 'package:pingis/utils/constants.dart';

class IntroScreen extends StatefulWidget {
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
              flex: 6,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 100),
                Container(padding: const EdgeInsets.all(12.0), child: Text(title, style: Theme.of(context).textTheme.headline))
              ]),
            ),
            Flexible(
              flex: 1,
              child: Column(children: [
                GoogleSignInButton(
                  onPressed: () async {
                    User user = await GoogleAuthService.signIn();
                    print(user);
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
                  },
                  borderRadius: 8,
                ),
              ])
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Created by Mathieu Devos', style: TextStyle(fontSize: 9, color: Colors.red[100]))
            ),
          ],
        )),
      )
    );
  }
}

//