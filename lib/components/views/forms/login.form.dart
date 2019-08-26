import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/state/notifiers/login_form.notifier.dart';
import 'package:pingis/utils/validators.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
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
      child: Consumer<LoginFormNotifier>(
        builder: (context, loginFormNotifier, _) {
          return Form(
            key: loginFormNotifier.loginFormKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: textTheme.title),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: textTheme.title.copyWith(color: Colors.black87, letterSpacing: 1.2),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: textTheme.body1.copyWith(color: Colors.grey),
                      icon: Icon(Icons.email, color: Colors.black87),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (input) => loginFormNotifier.email = input,
                    autovalidate: loginFormNotifier.autoValidating,
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
                    onChanged: (input) => loginFormNotifier.password = input,
                    autovalidate: loginFormNotifier.autoValidating,
                    validator: validatePassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () => { /* todo: implement */ },
                        padding: EdgeInsets.zero,
                        child: Text('Forgot Password?', style: textTheme.body1.copyWith(color: Colors.red[800]))
                      ),
                    ]
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