import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // IconSax package
import '../../../app_colors.dart'; // Color definitions

class ModernBottomNavBar extends StatefulWidget {
  @override
  _ModernBottomNavBarState createState() => _ModernBottomNavBarState();
}

class _ModernBottomNavBarState extends State<ModernBottomNavBar> {
  int _selectedIndex = 0;

  static const List<String> _routes = [
    '/home',
    '/earnings',
    '/tasks',
    '/services',
    '/profile'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Cleaner color usage
      selectedItemColor:  AppColors.secondary, // Selected color from AppColors
      unselectedItemColor: AppColors.primary, // Unselected color
      type: BottomNavigationBarType.fixed, // Keeps labels visible
      currentIndex: _selectedIndex, // Track the selected tab
      onTap: _onItemTapped, // Handle navigation on item tap
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home5), // IconSax Home icon
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.wallet), // IconSax Wallet icon
          label: 'Earnings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.task_square), // IconSax Task icon
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.briefcase), // IconSax Briefcase icon
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.profile_circle), // IconSax Briefcase icon
          label: 'Profile',
        ),
      ],
    );
  }
}