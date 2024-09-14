import 'package:flutter/material.dart';

class CurrentRankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),  // Reduced margin
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),  // Reduced padding
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),  // Slightly smaller border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,  // Reduced shadow blur
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.white, size: 18),  // Smaller icon size
          SizedBox(width: 4),
          Text(
            'Gold Rank - 70% to Platinum',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,  // Smaller font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
