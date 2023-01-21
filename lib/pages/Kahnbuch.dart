import 'package:flutter/material.dart';
import 'package:roigel_app_flutter/components/page_title/PageTitle.dart';

class Kahnbuch extends StatelessWidget {
  const Kahnbuch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [PageTitle(icon: Icon(Icons.kayaking), text: "Kahnbuch")],
    );
  }
}
