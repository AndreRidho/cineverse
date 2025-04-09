import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/main.dart';
import 'package:cineverse/widget/loading.dart';
import 'package:flutter/material.dart';

mixin Dialogs {
  void alertDialog(BuildContext context,
      {required String message,
      required String leftText,
      required String rightText,
      required Function() rightAction,
      Function() leftAction = pop,
      bool showLeft = true}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            if (showLeft)
              TextButton(
                onPressed: leftAction,
                child: Text(
                  leftText,
                  style: const TextStyle(color: blueGray),
                ),
              ),
            TextButton(
              onPressed: rightAction,
              child: Text(
                rightText,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }

  loadingDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.all(20),
        child: Loading(),
      ),
    );
  }

  snackMessage(context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
