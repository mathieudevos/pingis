import 'package:firebase_auth/firebase_auth.dart';

class User {
  final FirebaseUser user;
  var _eloRating, _gamesPlayed;

  // constructor
  User(this.user);

  // getters
  double getEloRating() => _eloRating;
  double getGamesPlayed() => _gamesPlayed;

  // setters
  void setEloRating(double newRating) => _eloRating = newRating;
  void setGamesPlayed(int newGamesPlayed) => _gamesPlayed = newGamesPlayed;

  // others
  void addGamePlayed() => _gamesPlayed++;
}