const title = 'Pingis';

class Constants {
  static final Constants _constants = new Constants._internal();

  factory Constants() {
    return _constants;
  }

  Constants._internal();

  // Exported methods
  static String getTitle() => title;
}