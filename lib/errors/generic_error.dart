import 'package:flutter/material.dart';

const String loginError = "An unexpected error occured:";

void displayGenericError(BuildContext context, Object e) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text("$loginError ${e.toString()}"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
