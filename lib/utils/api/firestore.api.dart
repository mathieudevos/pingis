import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pingis/models/user.model.dart';

class FirestoreAPI {
  final Firestore _db = Firestore.instance;

  // Singleton
  static final FirestoreAPI _firestoreAuthService = FirestoreAPI._internal();
  factory FirestoreAPI() => _firestoreAuthService;
  FirestoreAPI._internal();

  Future<User> getUser(String uid) async {
    if (uid == null) {
      return null;
    }

    final ref = await _db.collection('users').document(uid).get();
    if (!ref.exists) {
      return null;
    }
    return User(
      uid: uid,
      displayName: ref.data['displayName'],
      eloRating: ref.data['elo'],
      email: ref.data['email'],
      photoURL: ref.data['photoURL'] ?? null,
      gamesPlayed: ref.data['gamesPlayed'],
    );
  }

  void newUser(User user) async {
    final ref = _db.collection('users').document(user.uid);

    if ((await ref.get()).exists) {
      throw('[ERROR] Attempted to create newUser that already exists');
    }

    return ref.setData({
      'uid': user.uid,
      'lastSeen': DateTime.now(),
      'firstSeen': DateTime.now(),
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'gamesPlayed': user.gamesPlayed,
      'elo': user.eloRating,
    });
  }

  void upsertUser(User user) async {
    final ref = _db.collection('users').document(user.uid);

    if (!(await ref.get()).exists) {
      throw('[ERROR] Attempted to upsert User which is not found');
    }

    return ref.setData({
      'uid': user.uid,
      'lastSeen': DateTime.now(),
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'gamesPlayed': user.gamesPlayed,
      'elo': user.eloRating,
    }, merge: true);
  }
}