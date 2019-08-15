import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/models/user.model.dart';
import 'package:pingis/utils/auth/auth.dart';

enum AuthenticationStatus {
  Unitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
}

class AuthenticationModule with ChangeNotifier {
  AuthenticationStatus status = AuthenticationStatus.Unitialized;

  AuthenticationModule.initialize() {
    AuthService().onAuthStateChangeListener().listen(_onStateChanged);
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      status = AuthenticationStatus.Unauthenticated;
    } else {
      status = AuthenticationStatus.Authenticated;
    }
    notifyListeners();
  }
}

