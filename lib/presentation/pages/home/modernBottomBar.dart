import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class ModernBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Network'),
        BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Earnings'),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Tasks'),
      ],
      onTap: (index) {
  // Handle navigation, possibly using a switch case for each index
  switch (index) {
    case 0:
      // Navigate to Home
      Navigator.pushNamed(context, '/home');
      break;
    case 1:
      // Navigate to Network
      Navigator.pushNamed(context, '/network');
      break;
    case 2:
      // Navigate to Earnings
      Navigator.pushNamed(context, '/earnings');
      break;
    case 3:
      // Navigate to Tasks
      Navigator.pushNamed(context, '/tasks');
      break;
    default:
      // Handle unknown index
      break;
  }
}
    );
  }
}
