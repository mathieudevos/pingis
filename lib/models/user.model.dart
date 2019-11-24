import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  double eloRating;
  final String uid;
  int gamesPlayed;
  String displayName;
  String email;
  String photoURL;

  // constructor
  User({
    @required
    this.displayName,
    this.eloRating,
    this.email,
    this.gamesPlayed,
    this.uid,
    @optionalTypeArgs
    String photoURL = null,
  })
  : assert(displayName != null),
    assert(eloRating >= 0),
    assert(gamesPlayed >= 0),
    assert(email != null),
    assert(uid != null),
    photoURL = photoURL;

  static User generateNewUser(FirebaseUser user, { String username }) {
    return User(
      displayName: username ?? user.displayName ?? user.email.split('@')[0],
      eloRating: 800,
      email: user.email,
      gamesPlayed: 0,
      uid: user.uid,
    );
  }

  // getters
  String get initials {
    final names = displayName.split(' ').toList();
    if (names.length >= 2) {
      return '${names.first[0]}${names.last[0]}';
    }
    return displayName.substring(0, 2);
  }

  // others
  void addGamePlayed() => gamesPlayed++;
}
