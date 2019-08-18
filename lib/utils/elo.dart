import 'dart:math';
import 'package:pingis/models/user.model.dart';
import 'constants.dart';

double calculateProbablity(double ratingA, double ratingB) {
  return 1.0 / (1.0 + 1.0 * pow(10, 1.0 * (ratingA - ratingB) / 400));
}

double obtainK(User user) {
  if (user.gamesPlayed <= 30) {
    return Constants.kValues['initial'];
  }
  if (user.eloRating > 2400) {
    return Constants.kValues['high'];
  }
  return Constants.kValues['normal'];
}

List<double> obtainEloRatings(User userA, User userB, bool aWon) {
  double rA, rB;

  final double kA = obtainK(userA);
  final double kB = obtainK(userB);

  final double pA = calculateProbablity(userA.eloRating, userB.eloRating);
  final double pB = calculateProbablity(userB.eloRating, userA.eloRating);

  if (aWon) {
    rA = userA.eloRating + kA * (1 - pA);
    rB = userB.eloRating - kB * pB;
  } else {
    rA = userA.eloRating - kA * pA;
    rB = userB.eloRating + kB * (1 - pB);
  }
  return [rA, rB];
}
