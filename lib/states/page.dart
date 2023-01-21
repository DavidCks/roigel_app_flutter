import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:roigel_app_flutter/pages/Home.dart';
import 'package:roigel_app_flutter/pages/Essen.dart';
import 'package:roigel_app_flutter/pages/Kahnbuch.dart';
import 'package:roigel_app_flutter/pages/Settings.dart';

// Navigation
class RoigelAppPage with ChangeNotifier, DiagnosticableTreeMixin {
  Widget _page = const Home();

  Widget get page => _page;

  void set(Widget page) {
    _page = page;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('Page', _page));
  }
}
