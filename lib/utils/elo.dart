import 'dart:math';
import 'package:pingis/models/user.model.dart';
import 'constants.dart';

double calculateProbablity(double ratingA, double ratingB) {
  return 1.0 / (1.0 + 1.0 * pow(10, 1.0 * (ratingA - ratingB) / 400));
}

double obtainK(User user) {
  if (user.getGamesPlayed() <= 30) {
    return kValues['initial'];
  }
  if (user.getEloRating() > 2400) {
    return kValues['high'];
  }
  return kValues['normal'];
}

List<double> obtainEloRatings(User userA, User userB, bool aWon) {
  double rA, rB;

  double kA = obtainK(userA);
  double kB = obtainK(userB);

  double pA = calculateProbablity(userA.getEloRating(), userB.getEloRating());
  double pB = calculateProbablity(userB.getEloRating(), userA.getEloRating());

  if (aWon) {
    rA = userA.getEloRating() + kA * (1 - pA);
    rB = userB.getEloRating() - kB * pB;
  } else {
    rA = userA.getEloRating() - kA * pA;
    rB = userB.getEloRating() + kB * (1 - pB);
  }
  return [rA, rB];
}
