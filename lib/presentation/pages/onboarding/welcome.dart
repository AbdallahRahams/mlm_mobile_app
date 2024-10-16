import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // For consistent text styles
    final mediaQuery = MediaQuery.of(context);  // For responsive sizing

    return Scaffold(
      body: Container(
        color: AppColors.backgroundLight,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: mediaQuery.size.height * 0.3,  // Responsive image size
              width: mediaQuery.size.height * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40),
            Text(
              "Welcome to Your Future in MLM Marketing!",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Our platform empowers marketers to scale their business with the latest tools.",
              style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.text),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
