import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart'; // Assuming this contains your color constants

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
      child: SafeArea(
        child: Column(
          children: [
            // Upper part with Avatar and Total Earnings
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withOpacity(0.9),
                    AppColors.primary.withOpacity(0.9),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar with option to change
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.person,
                            size: 40, color: Colors.grey[700]),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Icon(Icons.camera_alt,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Total Earnings text
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total Earnings: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '\$1234.56', // Replace with dynamic value
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Lower part with fading background and menu options
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withOpacity(0.8),
                      AppColors.primary.withOpacity(0.9),
                    ],
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      icon: Icons.person_add,
                      text: 'Invite',
                      onTap: () {
                        Navigator.pushNamed(context, "/invite");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.account_balance_wallet,
                      text: 'My Wallet',
                      onTap: () {
                        Navigator.pushNamed(context, "/my-wallet");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.bar_chart,
                      text: 'Earnings',
                      onTap: () {
                        Navigator.pushNamed(context, "/earnings");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.payment,
                      text: 'Payment Info',
                      onTap: () {
                        Navigator.pushNamed(context, "/payment-info");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.person,
                      text: 'Profile',
                      onTap: () {
                        Navigator.pushNamed(context, "/profile");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.lock,
                      text: 'Change Password',
                      onTap: () {
                        Navigator.pushNamed(context, "/change-password");
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      onTap: () {
                        Navigator.pushNamed(context, "/settings");
                      },
                    ),
                    // Logout button with red text
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.red),
                      title:
                          Text('Logout', style: TextStyle(color: Colors.red)),
                      onTap: () {
                        Navigator.pushNamed(context, "/signin");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each drawer item
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon,
          color: AppColors.secondary), // Use secondary color for icons
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
