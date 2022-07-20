import 'package:flutter/material.dart';
import 'package:notes/main.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    showDialog(
        context: navigatorkey.currentState!.context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(description),
            ));
  }

  static int c = 0;
  //show Loading
  static void showLoading({String message = "Loading..."}) {
    c = 1;
    showDialog(
      context: navigatorkey.currentState!.context,
      builder: (_) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 5,
              ),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  //hide Loading
  static void hideLoading() {
    if (c == 1) {
      print('ik');
      //Navigator.of(navigatorkey.currentContext!).pop();
      Navigator.pop(navigatorkey.currentState!.context);
      c = 0;
    }
  }
}
