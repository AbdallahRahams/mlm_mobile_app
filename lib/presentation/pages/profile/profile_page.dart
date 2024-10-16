import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import 'qrCodeGenerator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.whiteTheme,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.appBartext.copyWith(
            fontSize: screenWidth * 0.07,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteTheme,  // Keep background color consistent
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionCard(
                context,
                title: 'Personal Information',
                children: _buildProfileDetailsSection(screenWidth),
              ),
              SizedBox(height: screenHeight * 0.02),
              
              _buildSectionCard(
                context,
                title: 'Account Details',
                children: _buildAccountDetailsSection(screenWidth),
              ),
              SizedBox(height: screenHeight * 0.02),
              
              _buildSectionCard(
                context,
                title: 'MLM Metrics',
                children: _buildMetricsSection(screenWidth),
              ),
              SizedBox(height: screenHeight * 0.02),
              
            ],
          ),
        ),
      ),
    );
  }

  // Card with Section Title and Content
  Widget _buildSectionCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Card(
      color: AppColors.cards,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.primary,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  // Section: Profile Details (Personal Information)
  List<Widget> _buildProfileDetailsSection(double screenWidth) {
    return [
      _buildEditableRow(Icons.email, "Email", "email@example.com", screenWidth),
      _buildEditableRow(Icons.phone, "Mobile", "+255 765 094 XXX", screenWidth),
      _buildEditableRow(Icons.person, "Gender", "Male/Female", screenWidth),
      _buildEditableRow(Icons.cake, "Date of Birth", "14th Oct, 2XXX", screenWidth),
    ];
  }

  // Section: Account Details
  List<Widget> _buildAccountDetailsSection(double screenWidth) {
    return [
      _buildEditableRow(Icons.account_circle, "Username", "YourUsername", screenWidth),
      _buildEditableRow(Icons.calendar_today, "Joined", "January 2023", screenWidth),
      _buildEditableRow(Icons.verified_user, "Status", "Active", screenWidth),
    ];
  }

  // Section: MLM Metrics
  List<Widget> _buildMetricsSection(double screenWidth) {
    return [
      _buildMetricsRow("Referrals", "25", screenWidth),
      _buildMetricsRow("Total Earnings", "\$1,250", screenWidth),
      _buildMetricsRow("Team Size", "50", screenWidth),
      SizedBox(height: 10),
      Text(
        'Referral Link:',
        style: AppTextStyles.subheading1.copyWith(color: AppColors.text),
      ),
      GestureDetector(
        onTap: () {
          print('Referral link copied!');
        },
        child: Text(
          'https://mlm-platform.com/referral/yourusername',
          style: AppTextStyles.link.copyWith(color: AppColors.secondary),
        ),
      ),
      QRCodeGenerator(
          referralLink: 'https://example.com/referral',
          companyName: 'Example Corp',
          companyIconPath: 'assets/images/company_logo.png', // Replace with actual image path
        ),
    ];
  }

  // Helper Widgets
  Widget _buildEditableRow(IconData icon, String label, String value, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: screenWidth * 0.06),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.subheading2.copyWith(
                    color: AppColors.text,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
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

  Widget _buildMetricsRow(String label, String value, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.subheading2.copyWith(
              color: AppColors.text,
              fontSize: screenWidth * 0.04,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: AppTextStyles.bodyText2.copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}