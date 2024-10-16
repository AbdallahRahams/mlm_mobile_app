import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class SolutionHighlightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.backgroundLight,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/solution_graphic.png',
              height: mediaQuery.size.height * 0.3,
              width: mediaQuery.size.height * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
  "Partner with Us and Thrive!",
  style: theme.textTheme.headlineSmall?.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  ),
  textAlign: TextAlign.center,
),
SizedBox(height: 20),
Text(
  "Unlock tailored solutions for business growth, marketing excellence, and software innovations designed to propel your MLM journey to the next level.",
  style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.text),
  textAlign: TextAlign.center,
),

          ],
        ),
      ),
    );
  }
}
