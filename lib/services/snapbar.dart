import 'package:flutter/material.dart';

class CustomSnapBar {
  static GlobalKey<ScaffoldMessengerState> msgkey =
      GlobalKey<ScaffoldMessengerState>();

  static verSnackBar(String msg) {
    final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          msg,
          style: TextStyle(color: Colors.white),
        ));
    msgkey.currentState!.showSnackBar(snackbar);
  }
}
