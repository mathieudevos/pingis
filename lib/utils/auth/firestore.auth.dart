import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAuthService {
  final Firestore _db = Firestore.instance;

  void updateUserData(FirebaseUser user) async {
    final DocumentReference ref = _db.collection('users').document(user.uid);

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
      'lastSeen': DateTime.now(),
    }, merge: true);
  }
}