import 'package:flutter/material.dart';

class TotalEarningsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),  // Further reduced padding
      child: Card(
        elevation: 2,  // Lower elevation for a cleaner look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),  // Slightly smaller border radius
        ),
        child: ListTile(
          leading: Icon(
            Icons.attach_money,
            color: Colors.green,
            size: 24,  // Reduced icon size
          ),
          title: Text(
            'Total Earnings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,  // Reduced font size for title
            ),
          ),
          subtitle: Text(
            '\$8,750.00',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 10,  // Reduced font size for subtitle
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,  // Further reduced trailing icon size
          ),
          onTap: () {
            // Navigate to earnings page
          },
        ),
      ),
    );
  }
}