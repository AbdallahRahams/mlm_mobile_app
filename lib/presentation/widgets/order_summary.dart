import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final String orderId;
  final double totalAmount;

  OrderSummary({
    required this.orderId,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text("Order ID: $orderId"),
        subtitle: Text("Total Amount: \$${totalAmount.toStringAsFixed(2)}"),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
