import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../../text_styles.dart';

// ProfilePage class implementation
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.appBartext,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category: Personal Information
              _buildCategoryTitle('Personal Information'),
              _buildProfileDetailsSection(),
              SizedBox(height: screenHeight * 0.04),

              // Category: Account Details
              Divider(color: AppColors.primary, thickness: 1),
              _buildCategoryTitle('Account Details'),
              _buildAccountDetailsSection(),
              SizedBox(height: screenHeight * 0.04),

              // Category: MLM Metrics
              Divider(color: AppColors.primary, thickness: 1),
              _buildCategoryTitle('MLM Metrics'),
              _buildMetricsSection(),
              SizedBox(height: screenHeight * 0.04),

              // Edit Profile Button
              _buildEditProfileButton(screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  // Category Titles
  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: AppTextStyles.heading3.copyWith(color: AppColors.primary),
      ),
    );
  }

  // Section: Profile Details (Personal Information)
  Widget _buildProfileDetailsSection() {
    return Column(
      children: [
        _buildEditableRow("Email", "email@example.com"),
        _buildEditableRow("Mobile", "+255 765 094 XXX"),
        _buildEditableRow("Gender", "Male/Female"),
        _buildEditableRow("Date of Birth", "14th Oct, 2XXX"),
      ],
    );
  }

  // Section: Account Details
  Widget _buildAccountDetailsSection() {
    return Column(
      children: [
        _buildEditableRow("Username", "YourUsername"),
        _buildEditableRow("Joined", "January 2023"),
        _buildEditableRow("Status", "Active"),
      ],
    );
  }

  // Section: MLM Metrics
  Widget _buildMetricsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMetricsRow("Referrals", "25"),
        _buildMetricsRow("Total Earnings", "\$1,250"),
        _buildMetricsRow("Team Size", "50"),
        SizedBox(height: 10),
        Text(
          'Referral Link:',
          style: AppTextStyles.subheading1.copyWith(color: AppColors.text),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            // Logic to copy referral link
            print('Referral link copied!');
          },
          child: Text(
            'https://mlm-platform.com/referral/yourusername',
            style: AppTextStyles.link.copyWith(color: AppColors.secondary),
          ),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            // Logic to show QR code
          },
          child: Text(
            'Show QR Code',
            style: AppTextStyles.link.copyWith(color: AppColors.secondary),
          ),
        ),
      ],
    );
  }

  // Button: Edit Profile
  Widget _buildEditProfileButton(double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Navigate to edit profile page
        },
        child: Text(
          'Edit Profile',
          style: AppTextStyles.buttonText.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildEditableRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.subheading2.copyWith(color: AppColors.text),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.bodyText2.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.subheading2.copyWith(color: AppColors.text),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.bodyText2.copyWith(color: AppColors.secondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
