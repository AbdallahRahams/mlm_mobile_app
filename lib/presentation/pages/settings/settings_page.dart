import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/presentation/pages/settings/about_page.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../../../app_colors.dart';
import '../notifications/NotificationsSettings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
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
          "Settings",
          style: AppTextStyles.appBartext.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.whiteTheme,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
        child: ListView(
          children: [
            // Account Settings Section
            Text(
              "Account Settings",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Profile Details Section
            buildSettingsTile(
              context,
              icon: Icons.person,
              title: "Profile Details",
              description: "Update your personal information",
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
            buildDivider(screenWidth),
            // Change Password Section
            buildSettingsTile(
              context,
              icon: Icons.lock,
              title: "Change Password",
              description: "Update your password",
              onTap: () {
                Navigator.pushNamed(context, "/change-password");
              },
            ),
            buildDivider(screenWidth),
            // Notification Settings Section
            buildSettingsTile(
              context,
              icon: Icons.notifications,
              title: "Notification Settings",
              description: "Manage notification preferences",
              onTap: () {
                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationSettingsPage()),
        );
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            // App Settings Section
            Text(
              "App Settings",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Language Preferences Section
            buildSettingsTile(
              context,
              icon: Icons.language,
              title: "Language Preferences",
              description: "Choose your preferred language",
              onTap: () {
                _showComingSoonBottomSheet(context, "Language Preferences");
              },
            ),
            buildDivider(screenWidth),
            // Theme Settings Section
            buildSettingsTile(
              context,
              icon: Icons.color_lens,
              title: "Theme Settings",
              description: "Customize the theme",
              onTap: () {
                _showComingSoonBottomSheet(context, "Theme Settings");
              },
            ),
            buildDivider(screenWidth),
            // About Section
            buildSettingsTile(
              context,
              icon: Icons.info,
              title: "About",
              description: "Learn more about this app",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required Function() onTap}) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: screenWidth * 0.08),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.text,
          fontSize: screenWidth * 0.05,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          color: AppColors.text,
          fontSize: screenWidth * 0.04,
        ),
      ),
      trailing: Icon(
        Iconsax.arrow_right5,
        color: AppColors.primary,
        size: screenWidth * 0.07,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.only(
        left: screenWidth * 0.04,
        right: screenWidth * 0.02, // Small padding on the right side
        top: screenWidth * 0.02,
        bottom: screenWidth * 0.02,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget buildDivider(double screenWidth) {
    return Divider(
      color: AppColors.background,
      thickness: 1,
      indent: screenWidth * 0.04,
      endIndent: screenWidth * 0.04,
    );
  }

  void _showComingSoonBottomSheet(BuildContext context, String feature) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
              Icons.info_outline,
              color: AppColors.error,
              size: 40,
            ),
            SizedBox(width: 20),
            // Title
            Text(
              "Coming Soon!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
              ],
            ),
            // Icon at the top
            
            SizedBox(height: 12),
            // Content text
            Text(
              "$feature will be available in future updates. Stay tuned!",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.text.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            // Button to dismiss the dialog
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

}

