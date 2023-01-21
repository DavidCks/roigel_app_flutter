import 'package:flutter/material.dart';

const String loginError =
    "Die eingegebenen daten sind falsch. Versuche es noch einmal";

void displayLoginError(context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text(loginError),
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
