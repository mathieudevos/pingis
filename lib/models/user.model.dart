import 'package:firebase_auth/firebase_auth.dart';

class User {
  final FirebaseUser _user;
  double eloRating;
  int gamesPlayed;

  // constructor
  User(this._user);

  // static factory constructor for firebase user
  static User createUser(FirebaseUser fUser) => (fUser == null) ? null : User(fUser);

  // getters
  String get photoURL => _user.photoUrl;
  String get initials {
    final names = _user.displayName.split(' ').toList();
    return '${names.first[0]}${names.last[0]}';
  }

  // others
  void addGamePlayed() => gamesPlayed++;
}
