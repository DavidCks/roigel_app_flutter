import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
      Divider()
    ]);
  }
}
