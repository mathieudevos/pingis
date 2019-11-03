import 'package:flutter/material.dart';
import 'package:pingis/components/views/buttons/login.buttons.dart';
import 'package:pingis/components/views/forms/login.form.dart';
import 'package:pingis/components/views/forms/signup.form.dart';
import 'package:pingis/components/views/icons/social.icons.dart';
import 'package:pingis/state/notifiers/login_form.notifier.dart';
import 'package:pingis/state/notifiers/signup_form.notifier.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:pingis/utils/constants.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  // Animation related items
  AnimationController controller;
  Animation<Offset> titleOffset;
  Animation<Offset> authFormOffset;
  Animation<Offset> authButtonsOffset;
  Animation<Offset> socialLoginOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this)..forward();
    titleOffset = Tween(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.4, curve: Curves.ease)));
    authFormOffset = Tween(begin: const Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.4, 0.6, curve: Curves.ease)));
    authButtonsOffset = Tween(begin: const Offset(0, 75), end: Offset.zero).animate(CurvedAnimation(
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

  Widget _authFormProvider(AuthenticationStatus authenticationStatus) {
    switch (authenticationStatus) {
      case AuthenticationStatus.Unauthenticated:
      case AuthenticationStatus.Authenticating:
        return LoginForm();
        break;
      case AuthenticationStatus.Signup:
        return SignupForm();
      case AuthenticationStatus.ForgotPassword:
        return const Text('oops forgot password!');
      default:
        return const Text('Could not load correct authentication form');
    }
    }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => AuthService()),
        ChangeNotifierProvider(builder: (_) => LoginFormNotifier()),
        ChangeNotifierProvider(builder: (_) => SignupFormNotifier()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Consumer<AuthService>(
          builder: (context, authService, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  position: authFormOffset,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: _authFormProvider(authService.status)
                    ),
                  ),
                ),
                SlideTransition(
                  position: authButtonsOffset,
                  child: LoginButtons(),
                ),
                Expanded(
                  child: SlideTransition(
                    position: socialLoginOffset,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () => { /* todo: implement */},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(SocialIcons.google, color: Theme.of(context).primaryColor, size: 20,),
                              const SizedBox(width: 20),
                              Text('SIGN IN WITH GOOGLE', style: textTheme.subtitle),
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text('Created by ${Constants.author}', style: textTheme.body1.copyWith(color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}