import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:your_project/main.dart'; // Update with your actual import path

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Auth flow test', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(MyApp());

    // Verify the initial screen is Sign In
    expect(find.text('Sign In'), findsOneWidget);

    // Tap on the Sign Up button
    await tester.tap(find.byKey(Key('signUpButton')));
    await tester.pumpAndSettle();

    // Verify that the Sign Up page is displayed
    expect(find.text('Sign Up'), findsOneWidget);

    // Fill out the Sign Up form and submit
    await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');
    await tester.tap(find.byKey(Key('submitButton')));
    await tester.pumpAndSettle();

    // Verify successful sign up (adapt based on your actual implementation)
    expect(find.text('Home'), findsOneWidget);
  });
}
