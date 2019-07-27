import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pingis/utils/constants.dart';
import 'home.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final title = Constants.getTitle();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 100),
              Container(padding: const EdgeInsets.all(12.0), child: Text(this.title, style: Theme.of(context).textTheme.headline))
            ]),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Text('Go home!'),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false),
            ),
          ),
        ],
      )),
    );
  }
}

//