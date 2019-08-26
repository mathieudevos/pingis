import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/models/user.model.dart';
import 'package:pingis/utils/auth/firebase.auth.dart';
import 'package:pingis/utils/auth/google.auth.dart';

enum AuthenticationStatus {
  Authenticated,
  Authenticating,
  ForgotPassword,
  Signup,
  Unauthenticated,
  Unitialized,
}

enum SignInMethod {
  Firebase,
  Google,
}

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth;
  AuthenticationStatus _status = AuthenticationStatus.Unitialized;
  User _user;
  SignInMethod method;

  AuthService() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged
      .map(User.createUser)
      .listen(_onAuthStateChanged);
  }

  AuthenticationStatus get status {
    print('[INFO] authentication.status: $_status');
    return _status ;
  }
  void set status(AuthenticationStatus authenticationStatus) {
    _status = authenticationStatus;
    notifyListeners();
  }

  User get user => _user;

  void signOut(BuildContext context) {
    switch (method) {
      case SignInMethod.Firebase:
        FirebaseAuthService(context).signOut();
        break;
      case SignInMethod.Google:
        GoogleAuthService(context).signOut();
        break;
      default:
        print('[ERROR] Attempted to sign out before signed in (no method)');
    }
    print('[INFO] Signed out');
  }

  Future<void> _onAuthStateChanged(User user) async {
    _user = user;
    if (user == null) {
      _status = AuthenticationStatus.Unauthenticated;
    } else {
      _status = AuthenticationStatus.Authenticated;
    }
    notifyListeners();
  }
}
