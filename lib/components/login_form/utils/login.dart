// ignore_for_file: use_build_context_synchronously

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roigel_app_flutter/errors/login_error.dart';
import 'package:roigel_app_flutter/errors/generic_error.dart';

Future<AuthResponse?> login(
    BuildContext context, String? email, String? password) async {
  AuthResponse? res;
  try {
    res = await Supabase.instance.client.auth.signInWithPassword(
      email: 'example@email.com',
      password: 'example-password',
    );
  } catch (e) {
    if (e is AuthException) {
      displayLoginError(context);
    } else {
      displayGenericError(context, e);
    }
  }
  return res;
}
