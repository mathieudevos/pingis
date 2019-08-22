import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showError(BuildContext context, dynamic error) {
  final scaffold = Scaffold.of(context, nullOk: true);
  if (scaffold == null) {
    print('[ERROR] Attempted to show error when no scaffold is present.\nError: $error');
  }
  final snackbar = SnackBar(
    content: Text(
      _parseError(error),
      style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white)),
    backgroundColor: Colors.red,
  );
  scaffold.showSnackBar(snackbar);
}

String _parseError(dynamic error) {
  if (error is PlatformException) {
    final PlatformException platformException = error;
    return platformException.message;
  }
  return error.toString();
}