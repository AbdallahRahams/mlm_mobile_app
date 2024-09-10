import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:your_project/main.dart'; // Update with your actual import path

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Order flow test', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(MyApp());

    // Navigate to Orders page
    await tester.tap(find.byKey(Key('ordersTab')));
    await tester.pumpAndSettle();

    // Verify the Orders page is displayed
    expect(find.text('Orders'), findsOneWidget);

    // Create a new order
    await tester.tap(find.byKey(Key('createOrderButton')));
    await tester.pumpAndSettle();

    // Fill out the Order form
    await tester.enterText(find.byKey(Key('productField')), 'Product A');
    await tester.enterText(find.byKey(Key('quantityField')), '2');
    await tester.tap(find.byKey(Key('submitOrderButton')));
    await tester.pumpAndSettle();

    // Verify the order was created successfully
    expect(find.text('Order Details'), findsOneWidget);
  });
}
