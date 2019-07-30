import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pingis/models/user.model.dart';
// import 'package:rxdart/rxdart.dart';

class GoogleAuthService {
  // Singleton creation
  static final GoogleAuthService _googleAuthService = new GoogleAuthService._internal();

  factory GoogleAuthService() {
    return _googleAuthService;
  }

  // Actual constructor
  GoogleAuthService._internal();

  // GoogleAuthService internals
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Firestore _db = Firestore.instance;

  static Future<void> signIn() async {

    // Sign in with Google
    GoogleSignInAccount gUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Push google auth to Firebase
    AuthCredential creds = GoogleAuthProvider.getCredential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    FirebaseUser fUser = (await _auth.signInWithCredential(creds)).user;
    print('Signed in: ' + fUser.displayName);

    // No need to await this, let it run in the background
    _updateUserData(fUser);
    return null;
  }

  static void _updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    if (!(await ref.get()).exists) {
      return ref.setData({
        'uid': user.uid,
        'email': user.email,
        'photoURL': user.photoUrl,
        'displayName': user.displayName,
        'lastSeen': DateTime.now(),
        'firstSeen': DateTime.now(),
        'elo': 800,
      }, merge: true);
    }

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
    }, merge: true);
  }

  static void signOut() {
    _auth.signOut();
  }
}
