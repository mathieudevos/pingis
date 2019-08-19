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

class AuthService with ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email, password;
  bool autoValidating = false;

  AuthenticationStatus _status = AuthenticationStatus.Unitialized;
  String _error;
  FirebaseAuth _auth;
  User _user;

  // Singleton creation
  static final AuthService _authService = AuthService._internal();
  factory AuthService () => _authService;
  AuthService._internal() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged
      .map(User.createUser)
      .listen(_onAuthStateChanged);
  }

  AuthenticationStatus get status {
    print('[INFO] get status: $_status');
    return _status ;
  }
  String get error => _error;
  User get user => _user;

  void set error(String msg) {
    _error = msg;
    notifyListeners();
  }

  void clearError() => _error = null;

  void signInWithEmailPassword() {
    if (loginFormKey.currentState.validate()) {
      print('$email - $password');
    } else {
      autoValidating = true;
      notifyListeners();
    }
  }

  void signOut() {
    GoogleAuthService()?.signOut();
    FirebaseAuthService()?.signOut();
    print('[INFO] Signed out');
    autoValidating = false;
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
