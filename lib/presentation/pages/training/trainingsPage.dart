import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import 'trainingVideoPage.dart';

class TrainingsPage extends StatefulWidget {
  const TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  int selectedCategoryIndex = 0;
  List<String> categories = [
    "All", "Marketing", "Sales", "Leadership", "Technical", "Motivation"
  ];

  List<Training> trainings = [
    Training(title: "Marketing Strategies", date: "12 Sep 2024", status: "Completed", videoUrl: "https://drive.google.com/uc?export=download&id=10XuSlS7iU6ifYhZCm2A4OnM5hLP-Wn2Y"),
    Training(title: "Advanced Sales Tactics", date: "22 Aug 2024", status: "Pending", videoUrl: "https://www.example.com/video2.mp4"),
    Training(title: "Leadership Skills", date: "15 Jul 2024", status: "Completed", videoUrl: "https://www.example.com/video3.mp4"),
    Training(title: "Technical Deep Dive", date: "30 Jun 2024", status: "Completed", videoUrl: "https://www.example.com/video4.mp4"),
    Training(title: "Motivational Talk", date: "10 May 2024", status: "Pending", videoUrl: "https://www.example.com/video5.mp4"),
  ];

  List<Training> getFilteredTrainings() {
    if (selectedCategoryIndex == 0) {
      return trainings; 
    } else {
      String selectedCategory = categories[selectedCategoryIndex];
      return trainings.where((training) => training.title.contains(selectedCategory)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trainings",
          style: AppTextStyles.heading2.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Navigation Bar
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == index
                            ? AppColors.primary.withOpacity(0.8)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            categories[index],
                            style: AppTextStyles.bodyText1.copyWith(
                              color: selectedCategoryIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: ListView.builder(
                itemCount: getFilteredTrainings().length,
                itemBuilder: (context, index) {
                  return TrainingCard(
                    training: getFilteredTrainings()[index],
                    screenWidth: screenWidth,
                    onTap: () {
                      // Navigate to TrainingVideoPage with training details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainingVideoPage(
                            training: getFilteredTrainings()[index],
                          ),
                        ),
                      );
                    },
                  );
                },
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
  final double screenWidth;
  final VoidCallback onTap; // Add callback for onTap

  const TrainingCard({required this.training, required this.screenWidth, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.4,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Iconsax.video5,
                        color: Colors.grey[700],
                        size: screenWidth * 0.1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Iconsax.play_circle, color: Colors.white, size: screenWidth * 0.1),
                    onPressed: () {
                      onTap();
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
                      fontSize: screenWidth * 0.045,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Scheduled: ${training.date}",
                    style: AppTextStyles.bodyText2.copyWith(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        training.status,
                        style: AppTextStyles.bodyText2.copyWith(
                          color: training.status == "Completed" ? Colors.green : Colors.redAccent,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Iconsax.like_1, color: AppColors.primary),
                            iconSize: screenWidth * 0.07,
                            onPressed: () {
                              // Like action
                            },
                          ),
                          IconButton(
                            icon: Icon(Iconsax.share, color: AppColors.primary),
                            iconSize: screenWidth * 0.07,
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
  final String videoUrl;

  Training({
    required this.title,
    required this.date,
    required this.status,
    required this.videoUrl,
  });
}
