import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roigel_app_flutter/components/page_title/PageTitle.dart';
import 'package:roigel_app_flutter/components/login_form/LoginForm.dart';
import 'package:supabase/supabase.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PageTitle(icon: Icon(Icons.home), text: "Home"),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: LoginForm(), // Perform login here
        )
      ],
    );
  }
}
