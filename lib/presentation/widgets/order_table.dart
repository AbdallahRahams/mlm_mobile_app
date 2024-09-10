import 'package:flutter/material.dart';

class OrderTable extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  OrderTable({required this.orders});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('Order ID')),
        DataColumn(label: Text('Product')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Price')),
      ],
      rows: orders.map((order) {
        return DataRow(cells: [
          DataCell(Text(order['id'].toString())),
          DataCell(Text(order['product'])),
          DataCell(Text(order['quantity'].toString())),
          DataCell(Text("\$${order['price'].toStringAsFixed(2)}")),
        ]);
      }).toList(),
    );
  }
}
