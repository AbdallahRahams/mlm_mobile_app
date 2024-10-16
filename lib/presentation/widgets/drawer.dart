import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart'; // Custom app colors

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        widthFactor: 0.7, // 70% of screen width
        child: Drawer(
          backgroundColor: AppColors.primary.withOpacity(0.9),
          child: Column(
            children: [
              _buildDrawerHeader(), // Header section (Avatar, Username, Role)
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      icon: Iconsax.profile_2user,
                      text: 'OnBoarding',
                      onTap: () => Navigator.pushNamed(context, "/onboarding"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.profile_2user,
                      text: 'Splash',
                      onTap: () => Navigator.pushNamed(context, "/splash"),
                    ),
                    _buildSection('Account'),
                    _buildDrawerItem(
                      icon: Iconsax.profile_2user,
                      text: 'Profile',
                      onTap: () => Navigator.pushNamed(context, "/profile"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.notification,
                      text: 'Notifications',
                      onTap: () => Navigator.pushNamed(context, "/notifications"),
                    ),
                    
                    const Divider(thickness: 1.5),
      
                    _buildSection('Financials'),
                    _buildDrawerItem(
                      icon: Iconsax.wallet_2,
                      text: 'My Wallet',
                      onTap: () => Navigator.pushNamed(context, "/my-wallet"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.chart,
                      text: 'Earnings',
                      onTap: () => Navigator.pushNamed(context, "/earnings"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.card_edit,
                      text: 'Payment Info',
                      onTap: () => Navigator.pushNamed(context, "/payment-info"),
                    ),
                    const Divider(thickness: 1.5),
      
                    _buildSection('Performance'),
                    _buildDrawerItem(
                      icon: Iconsax.ranking,
                      text: 'Ranks',
                      onTap: () => Navigator.pushNamed(context, "/ranks"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.crown_1,
                      text: 'Top Performers',
                      onTap: () => Navigator.pushNamed(context, "/top-performers"),
                    ),
                    const Divider(thickness: 1.5),
      
                    _buildSection('Other'),
                    _buildDrawerItem(
                      icon: Iconsax.book_square,
                      text: 'Training',
                      onTap: () => Navigator.pushNamed(context, "/trainings"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.lock,
                      text: 'Change Password',
                      onTap: () => Navigator.pushNamed(context, "/change-password"),
                    ),
                    _buildDrawerItem(
                      icon: Iconsax.setting_2,
                      text: 'Settings',
                      onTap: () => Navigator.pushNamed(context, "/settings"),
                    ),
                    const Divider(thickness: 1.5, color: Colors.red),
      
                    // Logout item
                    _buildDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Logout',
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () => Navigator.pushNamed(context, "/signin"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12), // Adjust padding for better responsiveness
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.9)],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe', // Dynamic username
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Marketer', // Dynamic role
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Category title
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Increased vertical padding for better spacing
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Drawer item with icon and text
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
    Color iconColor = AppColors.secondary, // Use secondary color for icons
    Color textColor = Colors.white,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}