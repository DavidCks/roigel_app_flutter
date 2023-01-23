import 'package:flutter_test/flutter_test.dart';
import 'package:roigel_app_flutter/components/login_form/LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  testWidgets('LoginForm is being built correctly',
      (WidgetTester tester) async {
    // Build the Material widget
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: LoginForm(),
      ),
    ));

    // Verify that the Material widget exists
    expect(find.byType(Material), findsWidgets);

    // Verify that the LoginForm widget exists
    expect(find.byType(LoginForm), findsOneWidget);

    // Verify that theres an email field
    expect(find.byKey(const Key('email_field')), findsOneWidget);
    // Verify that the email field is a text field
    expect(tester.widget(find.byKey(const Key('email_field'))),
        isInstanceOf<TextFormField>());

    // Verify that theres a password field
    expect(find.byKey(const Key('password_field')), findsOneWidget);
    // Verify that the password field is a text field
    expect(tester.widget(find.byKey(const Key('password_field'))),
        isInstanceOf<TextFormField>());

    // Verify that theres a login button
    expect(find.byKey(const Key('login_button')), findsOneWidget);
    // Verify that the login button is a text button
    expect(tester.widget(find.byKey(const Key('login_button'))),
        isInstanceOf<TextButton>());
  });

  testWidgets('LoginForm validator throws "no email" error',
      (WidgetTester tester) async {
    // Build the Material widget
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: LoginForm(),
      ),
    ));

    await testNoEmail(tester);
    await testNoPassword(tester);
    await testInvalidEmail(tester);
    await testNoData(tester);
  });
}

Future<void> testNoEmail(WidgetTester tester) async {
  await tester.enterText(find.byKey(const Key('email_field')), '');
  await tester.enterText(find.byKey(const Key('password_field')), 'password');

  // Tap the login button without an email being input
  await tester.tap(find.byKey(const Key('login_button')));
  // wait for the validato to print its message
  await tester.pump(const Duration(milliseconds: 100));
  // Verify that the validator gives an error
  expect(find.text('Gib deine Email-Adresse ein'), findsOneWidget);
}

Future<void> testNoPassword(WidgetTester tester) async {
  await tester.enterText(
      find.byKey(const Key('email_field')), 'test@example.com');
  await tester.enterText(find.byKey(const Key('password_field')), '');

  // Tap the login button without an email being input
  await tester.tap(find.byKey(const Key('login_button')));
  // wait for the validato to print its message
  await tester.pump(const Duration(milliseconds: 100));
  // Verify that the validator gives an error
  expect(find.text('Gib ein Passwort ein'), findsOneWidget);
}

Future<void> testInvalidEmail(WidgetTester tester) async {
  await tester.enterText(find.byKey(const Key('email_field')), 'test@example');
  await tester.enterText(find.byKey(const Key('password_field')), 'password');

  // Tap the login button without an email being input
  await tester.tap(find.byKey(const Key('login_button')));
  // wait for the validato to print its message
  await tester.pump(const Duration(milliseconds: 100));
  // Verify that the validator gives an error
  expect(find.text('Gib eine valide Email-Adresse ein'), findsOneWidget);
}

Future<void> testNoData(WidgetTester tester) async {
  await tester.enterText(find.byKey(const Key('email_field')), '');
  await tester.enterText(find.byKey(const Key('password_field')), '');

  // Tap the login button without an email being input
  await tester.tap(find.byKey(const Key('login_button')));
  // wait for the validato to print its message
  await tester.pump(const Duration(milliseconds: 100));
  // Verify that the validator gives an error
  expect(find.text('Gib ein Passwort ein'), findsOneWidget);
  expect(find.text('Gib deine Email-Adresse ein'), findsOneWidget);
}
