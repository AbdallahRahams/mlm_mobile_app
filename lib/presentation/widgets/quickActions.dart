import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../app_colors.dart';

class QuickActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Responsive width
        padding: const EdgeInsets.all(8.0), // Reduced padding for compact layout
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                // Dynamically calculate the number of columns based on screen size
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 3;
                return GridView.count(
                  shrinkWrap: true, // GridView takes only necessary space
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 4, // Reduced space between columns
                  mainAxisSpacing: 4,  // Reduced space between rows
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  children: [

                    CompactActionButton(
                      icon: Iconsax.user_add4,
                      label: "Invite",
                      color: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(context, '/invite');
                      },
                    ),
                    CompactActionButton(
                      icon: Iconsax.book_square,
                      label: "Trainings",
                      color: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(context, '/trainings');
                      },
                    ),
                    CompactActionButton(
                      icon: Iconsax.support,
                      label: "Support & Help",
                      color: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(context, '/support');
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// A custom widget for compact quick action buttons
class CompactActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  CompactActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28, // Slightly reduced icon size for a more compact look
            color: color,
          ),
          SizedBox(height: 4), // Reduced space between icon and text
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13, // Slightly reduced font size for compactness
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}