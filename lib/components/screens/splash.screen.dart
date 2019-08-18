import 'package:flutter/material.dart';
import 'package:pingis/components/views/backgrounds/fullpage.background.dart';
import 'package:pingis/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: FULLPAGE_BACKGROUND,
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
                      Container(padding: const EdgeInsets.all(12.0), child: Text(Constants.title, style: Theme.of(context).textTheme.headline))
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
                child: Text('Created by ${Constants.author}', style: TextStyle(fontSize: 9, color: Colors.red[100]))
              ),
            ),
          ]
        ),
      )
    );
  }
}