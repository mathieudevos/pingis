import 'package:firebase_auth/firebase_auth.dart';

class User {
  final FirebaseUser _user;
  double eloRating;
  int gamesPlayed;

  // constructor
  User(this._user);

  // others
  void addGamePlayed() => gamesPlayed++;
}
