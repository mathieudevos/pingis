import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'firestore.auth.dart';

class FirebaseAuthService {
  // Singleton creation on-need basis
  static FirebaseAuthService _firebaseAuthService;
  factory FirebaseAuthService() => _firebaseAuthService ??= FirebaseAuthService._internal();
  FirebaseAuthService._internal();

  // FirebaseAuthService internals
  final _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('[INFO] Signed in with FIREBASE: ' + authResult.user.displayName);
    AuthService().setCurrentUser(authResult.user);

    FirestoreAuthService().updateUserData(authResult.user);
  }

  Future<void> signUp(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('[INFO] Signed up with FIREBASE: ' + authResult.user.displayName);

    FirestoreAuthService().updateUserData(authResult.user);
  }

  void signOut() {
    _auth.signOut();
  }
}