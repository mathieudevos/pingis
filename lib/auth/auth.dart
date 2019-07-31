

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingis/auth/firebase.auth.dart';
import 'package:pingis/auth/google.auth.dart';
import 'package:pingis/models/user.model.dart';

enum SigninMethod { google, firebase }

class AuthService {
  // Singleton creation
  static AuthService _authService = AuthService._internal();
  factory AuthService () => _authService;
  AuthService._internal();

  static final _auth = FirebaseAuth.instance;
  static User _user;
  static SigninMethod _signinMethod;

  static void setCurrentUser(FirebaseUser fUser, SigninMethod signinMethod) {
    _user = User(fUser);
    _signinMethod = signinMethod;
  }

  Future<bool> isSignedIn() async {
    return _user != null;
  }

  Future<User> getCurrentUser() async {
    _user ??= User(await _auth.currentUser());
    return _user;
  }

  void signOut() {
    switch (_signinMethod) {
      case SigninMethod.google:
        GoogleAuthService.signOut();
        break;
      case SigninMethod.firebase:
        FirebaseAuthService.signOut();
        break;
      default:
        _auth.signOut();
    }
  }
}
