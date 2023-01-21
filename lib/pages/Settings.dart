import 'package:flutter/material.dart';
import 'package:roigel_app_flutter/components/page_title/PageTitle.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PageTitle(icon: Icon(Icons.settings), text: "Einstellungen")
      ],
    );
  }
}
