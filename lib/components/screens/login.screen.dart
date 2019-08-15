import 'package:flutter/material.dart';
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
            stops: const [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.red[800],
              Colors.red[600],
              Colors.red[500],
              Colors.red[300],
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 100),
                      Container(padding: const EdgeInsets.all(12.0), child: Text(title, style: Theme.of(context).textTheme.headline))
                    ]
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
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