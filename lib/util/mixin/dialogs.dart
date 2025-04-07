import 'package:cineverse/main.dart';
import 'package:flutter/material.dart';

mixin Dialogs {
  void errorDialog(
    BuildContext context,
    String message, {
    bool dismissable = true,
    Function? onPressed,
    Function? then,
    String? buttonText,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          content: Text(message),
          actions: [
            if (dismissable)
              TextButton(
                onPressed: () => onPressed == null ? pop() : onPressed(),
                child: Text(
                  buttonText ?? 'OK',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
          ],
        ),
      ).then(
        (value) => then == null ? {} : then(),
      ),
    );
  }

  loadingDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Loading...'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
