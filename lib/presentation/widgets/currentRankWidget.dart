import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart'; // Import IconSax for more modern icons

class CurrentRankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),  // Adjusted margin
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),  // Adjusted padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ AppColors.primary,  AppColors.primary.withOpacity(.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),  // Updated border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),  // Subtle shadow
            blurRadius: 8,  // Slightly larger shadow blur
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Iconsax.star5,  // Updated to use IconSax
            color: Color(0xFFFFD700),
            size: 24,  // Larger icon size
          ),
          SizedBox(width: 8),  // Adjusted spacing
          Expanded(
            child: Text(
              'Gold Rank - 70% to Platinum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,  // Increased font size
                fontWeight: FontWeight.w600,  // Slightly lighter weight
              ),
              overflow: TextOverflow.ellipsis,  // Handle overflow with ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
