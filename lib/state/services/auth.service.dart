import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:pingis/models/user.model.dart';
import 'package:pingis/utils/auth/firebase.auth.dart';
import 'package:pingis/utils/auth/google.auth.dart';

enum AuthenticationStatus {
  Authenticated,
  Authenticating,
  Unauthenticated,
  Unitialized,
}

enum SignInMethod {
  Facebook,
  Firebase,
  Google,
  LinkedIn,
  Twitter,
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
    print('[INFO] get status: $_status');
    return _status ;
  }

  User get user => _user;

  void signOut(BuildContext context) {
    switch (method) {
      case SignInMethod.Facebook:
        /* todo: implement */
        break;
      case SignInMethod.Firebase:
        FirebaseAuthService(context).signOut();
        break;
      case SignInMethod.Google:
        GoogleAuthService(context).signOut();
        break;
      case SignInMethod.LinkedIn:
        /* todo: implement */
        break;
      case SignInMethod.Twitter:
        /* todo: implement */
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
