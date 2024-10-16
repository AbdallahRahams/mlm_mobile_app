import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "About",
          style: AppTextStyles.appBartext.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.whiteTheme,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              _buildSectionTitle(
                "Welcome to ADMA",
                icon: Icons.corporate_fare,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "We aim to empower network marketers to efficiently manage and scale their businesses through our innovative app. "
                "Our goal is to provide an intuitive, user-friendly experience with key features designed for success.",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: AppColors.text.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              
              // Features Section
              _buildSectionTitle(
                "Features",
                icon: Icons.featured_play_list,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildFeature(
                "Profile Management",
                "Keep your personal and business information updated seamlessly.",
                Icons.person_outline,
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildFeature(
                "Notifications",
                "Stay informed with important updates and announcements in real time.",
                Icons.notifications_active_outlined,
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.04),

              // Developer Section
              _buildSectionTitle(
                "Developed by",
                icon: Icons.developer_mode_outlined,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "African Digital Marketing Agency is a leader in digital transformation, "
                "bringing innovative solutions to businesses and professionals worldwide.",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: AppColors.text.withOpacity(0.8),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Contact Information Section
              _buildSectionTitle(
                "Contact Us",
                icon: Icons.contact_support_outlined,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "For inquiries or support, reach out to us at:\n"
                "Email: support@africandigitalmarketing.com\n"
                "Phone: +255 123 456 789",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: AppColors.text.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles with icons
  Widget _buildSectionTitle(String title, {required IconData icon, required double screenWidth}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: screenWidth * 0.06),
        SizedBox(width: screenWidth * 0.02),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  // Helper method to build individual feature details
  Widget _buildFeature(String featureTitle, String description, IconData icon, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: screenWidth * 0.06),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                featureTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                  color: AppColors.text,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: AppColors.text.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}