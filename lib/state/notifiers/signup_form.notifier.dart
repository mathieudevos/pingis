import 'package:flutter/material.dart';
import 'package:pingis/utils/auth/firebase.auth.dart';

class SignupFormNotifier with ChangeNotifier {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  String username, email, password;
  bool _autoValidating = false;

  bool get autoValidating => _autoValidating;

  void set autoValidating(bool input) {
    _autoValidating = input;
    notifyListeners();
  }

  void signUpWithEmailPassword(BuildContext context) {
    if (signupFormKey.currentState.validate()) {
      FirebaseAuthService(context).signUp(username, email, password);
    } else {
      autoValidating = true;
      notifyListeners();
    }
  }
}