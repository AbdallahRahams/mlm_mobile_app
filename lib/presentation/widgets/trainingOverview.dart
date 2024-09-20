import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../app_colors.dart';
import '../../text_styles.dart';

class TrainingOverviewWidget extends StatelessWidget {
  final List<Training> trainings;

  const TrainingOverviewWidget({required this.trainings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Trainings",
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.primary,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3, // Limit to 3 videos
            itemBuilder: (context, index) {
              return TrainingCard(training: trainings[index]);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/trainings');
            },
            child: Text(
              "Explore More Trainings",
              style: AppTextStyles.bodyText1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // Use your primary color
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  final Training training;

  const TrainingCard({required this.training});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigate to detailed training video page or play video
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video thumbnail with play button overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    width: screenWidth,
                    height: 150, // Adjusted for a more compact thumbnail
                    color: Colors.grey[300], // Placeholder for thumbnail image
                    child: Center(
                      child: Icon(
                        Iconsax.video5,
                        color: Colors.grey[700],
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Iconsax.play_circle,
                        color: Colors.white, size: 40),
                    onPressed: () {
                      // Play video directly or navigate to player
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    training.title,
                    style: AppTextStyles.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Scheduled: ${training.date}",
                    style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        training.status,
                        style: AppTextStyles.bodyText2.copyWith(
                          color: training.status == "Completed"
                              ? Colors.green
                              : Colors.redAccent,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon:
                                Icon(Iconsax.like_1, color: AppColors.primary),
                            onPressed: () {
                              // Like action
                            },
                          ),
                          IconButton(
                            icon: Icon(Iconsax.share, color: AppColors.primary),
                            onPressed: () {
                              // Share action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Training {
  final String title;
  final String date;
  final String status;

  Training({required this.title, required this.date, required this.status});
}
