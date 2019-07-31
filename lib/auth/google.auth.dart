import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pingis/auth/auth.dart';
import 'package:pingis/auth/firestore.auth.dart';

class GoogleAuthService {
  // Singleton creation on-need basis
  static GoogleAuthService _googleAuthService;
  factory GoogleAuthService() => _googleAuthService ??= GoogleAuthService._internal();
  GoogleAuthService._internal();

  // GoogleAuthService internals
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<void> signIn() async {

    // Sign in with Google
    final gUser = await _googleSignIn.signIn();
    final gAuth = await gUser.authentication;

    // Push google auth to Firebase
    final creds = GoogleAuthProvider.getCredential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    final authResult = await _auth.signInWithCredential(creds);
    print('[INFO] Signed in with GOOGLE: ' + authResult.user.displayName);
    AuthService().setCurrentUser(authResult.user, SigninMethod.google);

    FirestoreAuthService().updateUserData(authResult.user);
  }

  void signOut() {
    _auth.signOut();
    _googleSignIn.signOut();
  }
}
