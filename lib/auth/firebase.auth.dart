import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingis/auth/auth.dart';
import 'package:pingis/auth/firestore.auth.dart';

class FirebaseAuthService {
  // Singleton creation on-need basis
  static FirebaseAuthService _firebaseAuthService;
  factory FirebaseAuthService() => _firebaseAuthService ??= FirebaseAuthService._internal();
  FirebaseAuthService._internal();

  // FirebaseAuthService internals
  static final _auth = FirebaseAuth.instance;

  static Future<void> signIn(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('[INFO] Signed in with FIREBASE: ' + authResult.user.displayName);
    AuthService.setCurrentUser(authResult.user, SigninMethod.firebase);

    FirestoreAuthService.updateUserData(authResult.user);
  }

  static Future<void> signUp(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('[INFO] Signed up with FIREBASE: ' + authResult.user.displayName);

    FirestoreAuthService.updateUserData(authResult.user);
  }

  static void signOut() {
    _auth.signOut();
  }
}