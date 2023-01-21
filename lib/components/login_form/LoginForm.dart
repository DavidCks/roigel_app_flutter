import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:email_validator/email_validator.dart';
import 'package:roigel_app_flutter/components/login_form/utils/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _is_logged_in =
      Supabase.instance.client.auth.currentUser == null ? false : true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Gib deine email adresse ein';
              }
              if (!EmailValidator.validate(value)) {
                return 'Gib eine valide email adresse ein';
              }
              return null;
            },
            onSaved: (value) => _email = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Gib ein passwort ein';
              }
              return null;
            },
            onSaved: (value) => _password = value,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print('email: $_email, password: $_password');
                // Perform login here
                login(context, _email, _password);
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
