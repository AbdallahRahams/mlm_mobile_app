import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../text_styles.dart';

class LatestNewsSection extends StatelessWidget {
  final List<String> newsTitles;

  const LatestNewsSection({
    Key? key,
    required this.newsTitles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Latest News',
            style: AppTextStyles.heading2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16, // Slightly smaller title font
            ),
          ),
        ),
        // Limit the height of the entire section
        SizedBox(
          height: newsTitles.length * 40.0, // Dynamic height based on items
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: newsTitles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: _buildNewsListItem(newsTitles[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsListItem(String title) {
    return GestureDetector(
      onTap: () {
        // Handle navigation to full news article page
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24, width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // News Title
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyText1.copyWith(
                  color: Colors.white,
                  fontSize: 14, // Small font for compactness
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Read More Action
            TextButton(
              onPressed: () {
                // Handle read more navigation
              },
              child: Text(
                'Read More',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}