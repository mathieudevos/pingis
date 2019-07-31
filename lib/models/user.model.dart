import 'package:firebase_auth/firebase_auth.dart';

class User {
  final FirebaseUser _user;
  var _eloRating, _gamesPlayed;

  // constructor
  User(this._user);

  // getters
  double get eloRating => _eloRating;
  int get gamesPlayed => _gamesPlayed;

  // setters
  set eloRating(double newRating) => _eloRating = newRating;
  set gamesPlayed(int newGamesPlayed) => _gamesPlayed = newGamesPlayed;

  // others
  void addGamePlayed() => _gamesPlayed++;
}
