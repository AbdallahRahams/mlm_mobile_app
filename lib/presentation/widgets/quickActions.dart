import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../text_styles.dart';

class QuickActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.8; // 80% of the screen width

    return Container(
      width: containerWidth, // Set the width to 80% of screen width
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Actions', style: AppTextStyles.heading2),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.add_task, 'New Task'),
              _buildActionButton(Icons.report, 'Reports'),
              _buildActionButton(Icons.support, 'Support'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: AppColors.secondary),
        SizedBox(height: 5),
        Text(label, style: AppTextStyles.bodyText2),
      ],
    );
  }
}
