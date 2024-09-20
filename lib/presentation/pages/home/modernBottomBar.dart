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
    '/network',
    '/earnings',
    '/tasks',
    '/services'
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
      backgroundColor: AppColors.primary, // Cleaner color usage
      selectedItemColor:  AppColors.secondary, // Selected color from AppColors
      unselectedItemColor: AppColors.backgroundLight, // Unselected color
      type: BottomNavigationBarType.fixed, // Keeps labels visible
      currentIndex: _selectedIndex, // Track the selected tab
      onTap: _onItemTapped, // Handle navigation on item tap
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home5), // IconSax Home icon
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.profile_2user), // IconSax Network icon
          label: 'Network',
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
      ],
    );
  }
}