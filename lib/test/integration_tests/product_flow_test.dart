import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:your_project/main.dart'; // Update with your actual import path

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Product flow test', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(MyApp());

    // Navigate to Products page
    await tester.tap(find.byKey(Key('productsTab')));
    await tester.pumpAndSettle();

    // Verify the Products page is displayed
    expect(find.text('Products'), findsOneWidget);

    // View product details
    await tester.tap(find.byKey(Key('productCard0')));
    await tester.pumpAndSettle();

    // Verify the Product Details page is displayed
    expect(find.text('Product Details'), findsOneWidget);

    // Add product to cart
    await tester.tap(find.byKey(Key('addToCartButton')));
    await tester.pumpAndSettle();

    // Verify that the product was added to the cart
    expect(find.text('Cart'), findsOneWidget);
  });
}

