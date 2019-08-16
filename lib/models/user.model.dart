import 'package:firebase_auth/firebase_auth.dart';

class User {
  final FirebaseUser _user;
  double eloRating;
  int gamesPlayed;

  // constructor
  User(this._user);

  // static factory constructor for firebase user
  static User createUser(FirebaseUser fUser) => (fUser == null) ? null : User(fUser);

  // others
  void addGamePlayed() => gamesPlayed++;
}
