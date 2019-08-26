import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/state/notifiers/signup_form.notifier.dart';
import 'package:pingis/utils/validators.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
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
      child: Consumer<SignupFormNotifier>(
        builder: (context, signupFormNotifier, _) {
          return Form(
            key: signupFormNotifier.signupFormKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
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
                    onChanged: (input) => signupFormNotifier.username = input,
                    autovalidate: signupFormNotifier.autoValidating,
                    validator: validateUsername,
                  ),
                  Divider(),
                  TextFormField(
                    style: textTheme.title.copyWith(color: Colors.black87, letterSpacing: 1.2),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: textTheme.body1.copyWith(color: Colors.grey),
                      icon: Icon(Icons.email, color: Colors.black87),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (input) => signupFormNotifier.email = input,
                    autovalidate: signupFormNotifier.autoValidating,
                    validator: validateEmail,
                  ),
                  Divider(),
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
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}