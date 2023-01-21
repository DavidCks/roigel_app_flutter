import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:roigel_app_flutter/states/page.dart';

import 'package:roigel_app_flutter/pages/Home.dart';
import 'package:roigel_app_flutter/pages/Essen.dart';
import 'package:roigel_app_flutter/pages/Kahnbuch.dart';
import 'package:roigel_app_flutter/pages/Settings.dart';

class RoigelNavigationBar extends StatefulWidget {
  const RoigelNavigationBar({super.key});

  @override
  State<RoigelNavigationBar> createState() => _RoigelNavigationBarState();
}

class _RoigelNavigationBarState extends State<RoigelNavigationBar> {
  int _selectedIndex = 0;
  final _pageOptions = const [Home(), Essen(), Kahnbuch(), Settings()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            label: "Essen",
            icon: Icon(Icons.restaurant),
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            label: "Kahn",
            icon: Icon(Icons.kayaking),
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            label: "Einstellungen",
            icon: Icon(Icons.settings),
            backgroundColor: Colors.blue),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        context.read<RoigelAppPage>().set(_pageOptions[index]);
      },
    );
  }
}
