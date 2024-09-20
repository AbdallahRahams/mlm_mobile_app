import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../../../app_colors.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: AppTextStyles.appBartext,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Account Settings Section
            const Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 16),
            // Profile Details Section
            buildSettingsTile(
              context,
              icon: Icons.person,
              title: "Profile Details",
              description: "Update your personal information",
              onTap: () {
                // Navigate to Profile Details
              },
            ),
            buildDivider(),
            // Change Password Section
            buildSettingsTile(
              context,
              icon: Icons.lock,
              title: "Change Password",
              description: "Update your password",
              onTap: () {
                // Navigate to Change Password
              },
            ),
            buildDivider(),
            // Notification Settings Section
            buildSettingsTile(
              context,
              icon: Icons.notifications,
              title: "Notification Settings",
              description: "Manage notification preferences",
              onTap: () {
                // Navigate to Notification Settings
              },
            ),
            const SizedBox(height: 16),
            // App Settings Section
            const Text(
              "App Settings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 16),
            // Language Preferences Section
            buildSettingsTile(
              context,
              icon: Icons.language,
              title: "Language Preferences",
              description: "Choose your preferred language",
              onTap: () {
                // Navigate to Language Preferences
              },
            ),
            buildDivider(),
            // Theme Settings Section
            buildSettingsTile(
              context,
              icon: Icons.color_lens,
              title: "Theme Settings",
              description: "Customize the theme",
              onTap: () {
                // Navigate to Theme Settings
              },
            ),
            buildDivider(),
            // About Section
            buildSettingsTile(
              context,
              icon: Icons.info,
              title: "About",
              description: "Learn more about this app",
              onTap: () {
                // Navigate to About Page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsTile(BuildContext context,
      {required IconData icon, required String title, required String description, required Function() onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(color: AppColors.text),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget buildDivider() {
    return const Divider(
      color: AppColors.background,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}