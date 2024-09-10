import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;

  ProductCard({
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("\$${productPrice.toStringAsFixed(2)}"),
        trailing: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
