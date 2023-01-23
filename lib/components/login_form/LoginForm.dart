import 'package:flutter/material.dart';
import 'package:roigel_app_flutter/global_utils/init_supabase.dart';
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
  bool _is_logged_in = false;

  @override
  void initState() {
    super.initState();
    try {
      init_supabase_auth().then((_) => {
            if (Supabase.instance.client.auth.currentUser != null)
              {
                setState(() {
                  _is_logged_in = true;
                })
              }
            else
              {
                setState(() {
                  _is_logged_in = false;
                })
              }
          });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key('email_field'),
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Gib deine Email-Adresse ein';
              }
              if (!EmailValidator.validate(value)) {
                return 'Gib eine valide Email-Adresse ein';
              }
              return null;
            },
            onSaved: (value) => _email = value,
          ),
          TextFormField(
            key: const Key('password_field'),
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Gib ein Passwort ein';
              }
              return null;
            },
            onSaved: (value) => _password = value,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            key: const Key('login_button'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
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
