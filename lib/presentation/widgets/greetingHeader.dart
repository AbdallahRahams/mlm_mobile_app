import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import '../../text_styles.dart';

class GreetingHeader extends StatelessWidget {
  final String username;

  const GreetingHeader({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: AppTextStyles.bodyText1.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        username.length > 8 ? '${username.substring(0, 8)}...' : username,
                        style: AppTextStyles.heading2.copyWith(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Iconsax.verify5,
                        size: 22,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
    );
  }
}