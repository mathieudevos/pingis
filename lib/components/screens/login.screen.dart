import 'package:flutter/material.dart';
import 'package:pingis/components/views/buttons/border.button.dart';
import 'package:pingis/components/views/buttons/filled.button.dart';
import 'package:pingis/components/views/forms/login.form.dart';
import 'package:pingis/components/views/icons/roundedIcon.dart';
import 'package:pingis/components/views/icons/social.icons.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:pingis/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  Widget _horizontalLine() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      width: 50,
      height: 1,
      color: Colors.black26,
    )
  );

  // Animation related items
  AnimationController controller;
  Animation<Offset> titleOffset;
  Animation<Offset> loginFormOffset;
  Animation<Offset> loginButtonOffset;
  Animation<Offset> socialLoginOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this)..forward();
    titleOffset = Tween(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.4, curve: Curves.ease)));
    loginFormOffset = Tween(begin: const Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.4, 0.6, curve: Curves.ease)));
    loginButtonOffset = Tween(begin: const Offset(0, 75), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 0.8, curve: Curves.ease)));
    socialLoginOffset = Tween(begin: const Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.8, 1.0, curve: Curves.ease)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      builder: (_) => AuthService(),
      child: Consumer<AuthService>(
        builder: (context, authService, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTransition(
                      position: titleOffset,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/pingpong-cloud.png', fit: BoxFit.contain, height: 80),
                            Container(padding: const EdgeInsets.all(12.0), child: Text(Constants.title, style: Theme.of(context).textTheme.headline))
                          ]
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: loginFormOffset,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                        child: LoginForm(),
                      ),
                    ),
                    SlideTransition(
                      position: loginButtonOffset,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: BorderButton(
                              height: 40,
                              width: 120,
                              child: Text('SIGN UP', style: textTheme.title),
                              onPressed: () => { },
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: FilledButton(
                              height: 40,
                              width: 120,
                              child: Text('SIGN IN', style: textTheme.title.copyWith(color: Colors.white)),
                              onPressed: AuthService().signInWithEmailPassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SlideTransition(
                  position: socialLoginOffset,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _horizontalLine(),
                            Text('Social Logins', style: textTheme.title.copyWith(fontSize: 16)),
                            _horizontalLine(),
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIcon(
                              color: const Color(0xff3b5998),
                              iconData: SocialIcons.facebook,
                              onPressed: () => { /* todo: implement */ },
                            ),
                            RoundedIcon(
                              color: const Color(0xff00aced),
                              iconData: SocialIcons.twitter,
                              onPressed: () => { /* todo: implement */ },
                            ),
                            RoundedIcon(
                              color: const Color(0xffff3e30),
                              iconData: SocialIcons.google,
                              onPressed: () => { /* todo: implement */ },
                            ),
                            RoundedIcon(
                              color: const Color(0xff333333),
                              iconData: SocialIcons.linkedin,
                              onPressed: () => { /* todo: implement */ },
                            ),
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Text('Created by ${Constants.author}', style: textTheme.body1.copyWith(color: Colors.grey)),
                      )
                    ],
                  ),
                ),
              ]
            ),
          );
        }
      )
    );
  }
}