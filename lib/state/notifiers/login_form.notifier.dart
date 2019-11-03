import 'package:flutter/material.dart';
import 'package:pingis/utils/auth/firebase.auth.dart';

class LoginFormNotifier with ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email, password;
  bool _autoValidating = false;

  bool get autoValidating => _autoValidating;

  void set autoValidating(bool input) {
    print('[INFO] LoginFormNotifier.autoValidating: $input');
    _autoValidating = input;
    notifyListeners();
  }

  void signInWithEmailPassword(BuildContext context) {
    if (loginFormKey.currentState.validate()) {
      FirebaseAuthService(context).signIn(email, password);
    } else {
      autoValidating = true;
      notifyListeners();
    }
  }
}