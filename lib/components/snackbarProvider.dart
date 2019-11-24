import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showError(BuildContext context, dynamic error) {
  print('[ERROR] ${error.toString()}');
  Flushbar flushbar;
  flushbar = Flushbar(
    titleText: Text('Error occured', style: TextStyle(color: Colors.red[600])),
    messageText: Text(_parseError(error), style: TextStyle(color: Colors.red[500])),
    icon: Icon(Icons.error_outline, color: Colors.red[600]),
    isDismissible: true,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    mainButton: FlatButton(
      onPressed: () { flushbar.dismiss(true); },
      child: Icon(Icons.cancel, color: Colors.red[500]),
    ),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: 8.0,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: const EdgeInsets.all(8.0),
  );

  flushbar.show(context);
}

String _parseError(dynamic error) {
  if (error is PlatformException) {
    final PlatformException platformException = error;
    return platformException.message;
  }
  return error.toString();
}