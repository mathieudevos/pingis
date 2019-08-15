import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingis/models/user.model.dart';
import 'firebase.auth.dart';
import 'google.auth.dart';

class AuthService {
  // Singleton creation
  static AuthService _authService = AuthService._internal();
  factory AuthService () => _authService;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;

  void setCurrentUser(FirebaseUser fUser) {
    _user = User(fUser);
  }

  Future<bool> isSignedIn() async {
    return _user != null;
  }

  Future<User> get currentUser async {
    final fUser = await _auth.currentUser();
    if (fUser == null) return null;
    return User(fUser);
  };

  void signOut() {
    GoogleAuthService()?.signOut();
    FirebaseAuthService()?.signOut();
  }

  Stream<User> onAuthStateChangeListener() => _auth.onAuthStateChanged
    .map((fUser) => (fUser == null) ? null : User(fUser));
}
