import 'package:flutter/material.dart';

class UiUtils {

  static Future<void> showAlertDialog(
    BuildContext context, {
    String? title,
    required String message,
    required bool isDismissible,
    bool hasCircularProgressIndicator = false,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : Container(),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (hasCircularProgressIndicator)
                  const CircularProgressIndicator(),
                if(hasCircularProgressIndicator)
                  const SizedBox(width: 10),
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            isDismissible ? TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ) : Container()
          ],
        );
      },
    );
  }

  // show snackbar with a message
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}