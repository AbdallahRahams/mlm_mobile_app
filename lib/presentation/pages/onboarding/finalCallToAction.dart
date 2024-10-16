import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class FinalCallToActionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Use theme for consistency
    final mediaQuery = MediaQuery.of(context); // Use for responsive sizing

    return Scaffold(
      body: Container(
        color: AppColors.backgroundLight,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30), // Added vertical padding for better spacing
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Proper spacing between content
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          children: [
            // Image
            Image.asset(
              'assets/images/get_started.png',
              height: mediaQuery.size.height *
                  0.4, // Responsive image height (40% of screen height)
              fit: BoxFit.contain, // Ensure the image maintains aspect ratio
            ),

            // Title Text
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10), // Padding for better alignment
              child: Text(
                "Ready to Elevate Your Network Marketing Success?",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20), // Adjusted spacing between text and button

            // Button at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Get Started Now"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: AppColors.primary,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Slightly more rounded button
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
