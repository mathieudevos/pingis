import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/components/views/buttons/login.buttons.dart';
import 'package:pingis/state/notifiers/login_form.notifier.dart';
import 'package:pingis/state/notifiers/signup_form.notifier.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:pingis/utils/validators.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final loginFormNotifier = Provider.of<LoginFormNotifier>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<SignupFormNotifier>(
      builder: (context, signupFormNotifier, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, 15),
                      blurRadius: 15,
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, -10),
                      blurRadius: 10,
                    ),
                  ]
                ),
                child: Form(
                  key: signupFormNotifier.signupFormKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sign up', style: textTheme.title),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: textTheme.title.copyWith(color: Colors.black87, letterSpacing: 1.2),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username / Displayname',
                            hintStyle: textTheme.body1.copyWith(color: Colors.grey),
                            icon: Icon(Icons.person, color: Colors.black87),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          onChanged: (input) => signupFormNotifier.username = input.trim(),
                          autovalidate: signupFormNotifier.autoValidating,
                          validator: validateUsername,
                        ),
                        const Divider(),
                        TextFormField(
                          style: textTheme.title.copyWith(color: Colors.black87, letterSpacing: 1.2),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: textTheme.body1.copyWith(color: Colors.grey),
                            icon: Icon(Icons.email, color: Colors.black87),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          onChanged: (input) => signupFormNotifier.email = input.trim(),
                          autovalidate: signupFormNotifier.autoValidating,
                          validator: validateEmail,
                        ),
                        const Divider(),
                        TextFormField(
                          style: textTheme.title.copyWith(color: Colors.black87, letterSpacing: 1.2),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: textTheme.body1.copyWith(color: Colors.grey),
                            icon: Icon(Icons.lock, color: Colors.black87),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onChanged: (input) => signupFormNotifier.password = input,
                          autovalidate: signupFormNotifier.autoValidating,
                          validator: validatePassword,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                authService.status = AuthenticationStatus.Unauthenticated;
                                loginFormNotifier.autoValidating = false;
                              },
                              padding: EdgeInsets.zero,
                              child: Text('Back to sign in!', style: textTheme.body1.copyWith(color: Colors.red[800])),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            LoginButtons(),
          ],
        );
      },
    );
  }
}