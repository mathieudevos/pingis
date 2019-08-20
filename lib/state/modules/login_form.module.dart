import 'package:flutter/material.dart';

class LoginFormModule with ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email, password;
  bool _autoValidating = false;

  // Lazy singleton
  static LoginFormModule _loginFormModule;
  factory LoginFormModule() => _loginFormModule ??= LoginFormModule._internal();
  LoginFormModule._internal();

  bool get autoValidating => _autoValidating;

  void set autoValidating(bool input) {
    _autoValidating = input;
    notifyListeners();
  }

  void signInWithEmailPassword() {
    if (loginFormKey.currentState.validate()) {
      print('$email - $password');
    } else {
      autoValidating = true;
      notifyListeners();
    }
  }
}