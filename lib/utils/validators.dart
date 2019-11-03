String validateEmail(String value) {
  const pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid Email';
  }
  return null;
}

String validatePassword(String value) {
  if (value.length < 8) {
    return 'Minimum password length is 8';
  }
  return null;
}

String validateUsername(String value) {
  if (value.length < 3) {
    return 'Minimum username length is 3';
  }
  return null;
}