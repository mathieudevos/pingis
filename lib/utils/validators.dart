String validateEmail(String value) {
  const pattern =
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';
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