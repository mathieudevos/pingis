import 'package:flutter/material.dart';
import 'package:pingis/components/views/buttons/border.button.dart';
import 'package:pingis/components/views/buttons/filled.button.dart';
import 'package:pingis/state/notifiers/login_form.notifier.dart';
import 'package:pingis/state/notifiers/signup_form.notifier.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:provider/provider.dart';

class LoginButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final authService = Provider.of<AuthService>(context);
    final loginFormNotifier = Provider.of<LoginFormNotifier>(context);
    final signupFormNotifier = Provider.of<SignupFormNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: BorderButton(
            height: 40,
            width: 120,
            child: Text(
              authService.status != AuthenticationStatus.Signup ? 'SIGN UP' : 'CANCEL',
              style: textTheme.title
            ),
            onPressed: () {
              authService.method = SignInMethod.Firebase;
              if (authService.status != AuthenticationStatus.Signup) {
                authService.status = AuthenticationStatus.Signup;
              } else {
                authService.status = AuthenticationStatus.Unauthenticated;
              }
            },
          )
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: FilledButton(
            height: 40,
            width: 120,
            child: Text(
              authService.status != AuthenticationStatus.Signup ? 'SIGN IN' : 'SIGN UP',
              style: textTheme.title.copyWith(color: Colors.white)
            ),
            onPressed: () {
              authService.method = SignInMethod.Firebase;
              if (authService.status != AuthenticationStatus.Signup) {
                loginFormNotifier.signInWithEmailPassword(context);
              } else {
                signupFormNotifier.signUpWithEmailPassword(context);
              }
            },
          ),
        ),
      ],
    );
  }
}