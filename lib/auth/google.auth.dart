import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class GoogleAuthService {
  // Singleton creation
  static final GoogleAuthService _googleAuthService = new GoogleAuthService._internal();

  factory GoogleAuthService() {
    return _googleAuthService;
  }

  // Actual constructor
  GoogleAuthService._internal() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data);
      }
      return Observable.just({});
    });
  }

  // GoogleAuthService internals
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;

  PublishSubject loading = PublishSubject();

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);

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
    loading.add(false);
    return fUser;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
  }
}
