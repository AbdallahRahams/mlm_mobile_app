import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart';

class CurrentRankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Slightly increased vertical padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Iconsax.star5,
            color: Color(0xFFFFD700),
            size: 28, // Slightly larger icon size for better visibility
          ),
          SizedBox(width: 10), // Increased spacing for better balance
          Expanded(
            child: Text(
              'Gold Rank - 70% to Platinum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
