import 'package:flutter/material.dart';

void showError(BuildContext context, String message) {
  final scaffold = Scaffold.of(context, nullOk: true);
  if (scaffold == null) {
    print('[ERROR] Attempted to show error when no scaffold is present.\nError: $message');
  }
  final snackbar = SnackBar(
    content: Text(message, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white)),
    backgroundColor: Colors.red,
  );
  scaffold.showSnackBar(snackbar);
}