import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../text_styles.dart';

class MotivationalQuotesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.9;

    return Container(
      width: containerWidth,
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
          Text('Motivation', style: AppTextStyles.heading2),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.bodyText1.copyWith(color: AppColors.primary), // Default text style
              children: <TextSpan>[
                TextSpan(
                  text: '“The only limit to our realization of tomorrow is our doubts of today.” ',
                  style: AppTextStyles.bodyText1.copyWith(color: Colors.black87), // Customize the color or style
                ),
                TextSpan(
                  text: '- Franklin D. Roosevelt',
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.secondary, // Different color for the author
                    fontStyle: FontStyle.italic, // Optional: italicize the author’s name
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
