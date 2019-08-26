import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAuthService {
  final Firestore _db = Firestore.instance;

  // Singleton
  static final FirestoreAuthService _firestoreAuthService = FirestoreAuthService._internal();
  factory FirestoreAuthService() => _firestoreAuthService;
  FirestoreAuthService._internal();

  void updateUserData(FirebaseUser user, { String username }) async {
    final DocumentReference ref = _db.collection('users').document(user.uid);

    if (!(await ref.get()).exists) {
      return ref.setData({
        'uid': user.uid,
        'email': user.email,
        'photoURL': user.photoUrl,
        'displayName': username ?? user.displayName,
        'lastSeen': DateTime.now(),
        'firstSeen': DateTime.now(),
        'elo': 800,
      }, merge: true);
    }

    return ref.setData({
      'uid': user.uid,
      'lastSeen': DateTime.now(),
    }, merge: true);
  }
}