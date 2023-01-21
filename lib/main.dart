import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:roigel_app_flutter/app_bar.dart';
import 'package:roigel_app_flutter/navigation_bar.dart';
import 'package:provider/provider.dart';

import 'package:roigel_app_flutter/states/page.dart';
import 'package:roigel_app_flutter/styles/app_bar_style.dart';

void main() {
  Supabase.initialize(
      url: 'http://localhost:8000',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE');
  SupabaseAuth.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RoigelAppPage()),
      ],
      child: const RoigelApp(),
    ),
  );
}

class RoigelApp extends StatelessWidget {
  const RoigelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roigel App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const RoigelAppHomePage(title: 'Roigel App'),
    );
  }
}

class RoigelAppHomePage extends StatefulWidget {
  const RoigelAppHomePage({super.key, required this.title});

  final String title;

  @override
  State<RoigelAppHomePage> createState() => _RoigelAppHomePageState();
}

class _RoigelAppHomePageState extends State<RoigelAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: appBarBackgroudColor,
        shadowColor: appBarShadowColor,
        title: const RoigelAppBar(),
      ),
      body: context.watch<RoigelAppPage>().page,
      bottomNavigationBar: const RoigelNavigationBar(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
