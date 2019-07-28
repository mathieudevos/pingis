
class User {
  final String uuid;
  var _eloRating, _gamesPlayed;

  // constructor
  User(this.uuid);

  // getters
  double getEloRating() => _eloRating;
  double getGamesPlayed() => _gamesPlayed;

  // setters
  void setEloRating(double newRating) => _eloRating = newRating;
  void setGamesPlayed(int newGamesPlayed) => _gamesPlayed = newGamesPlayed;

  // others
  void addGamePlayed() => _gamesPlayed++;
}
