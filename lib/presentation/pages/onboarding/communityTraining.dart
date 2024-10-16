import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class CommunityTrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        color: AppColors.backgroundLight,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/community_training.png',
              height: mediaQuery.size.height * 0.3,
              width: mediaQuery.size.height * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
  "Unlock Your Potential with Us!",
  style: theme.textTheme.headlineSmall?.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  ),
  textAlign: TextAlign.center,
),
SizedBox(height: 20),
Text(
  "Learn, grow, and achieve your goals with our comprehensive training and support designed to boost your MLM success.",
  style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.text),
  textAlign: TextAlign.center,
),

          ],
        ),
      ),
    );
  }
}