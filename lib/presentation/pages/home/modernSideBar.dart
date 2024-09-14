import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class ModernSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.background,
      child: Column(
        children: [
          Icon(Icons.home, size: 40, color: AppColors.primary),
          // Add other navigation icons here, for example:
          ListTile(
            leading: Icon(Icons.group, color: AppColors.secondary),
            title: Text('Network', style: TextStyle(color: AppColors.secondary)),
            onTap: () {
              // Handle navigation to Network page
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: AppColors.secondary),
            title: Text('Earnings', style: TextStyle(color: AppColors.secondary)),
            onTap: () {
              // Handle navigation to Earnings page
            },
          ),
          ListTile(
            leading: Icon(Icons.task_alt, color: AppColors.secondary),
            title: Text('Tasks', style: TextStyle(color: AppColors.secondary)),
            onTap: () {
              // Handle navigation to Tasks page
            },
          ),
          // Add more ListTile widgets for different sections
        ],
      ),
    );
  }
}
