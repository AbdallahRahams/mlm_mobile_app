import 'dart:ui'; // For the frosted glass effect
import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class ServicesOverviewWidget extends StatefulWidget {
  @override
  _ServicesOverviewWidgetState createState() => _ServicesOverviewWidgetState();
}

class _ServicesOverviewWidgetState extends State<ServicesOverviewWidget> {
  final List<Map<String, dynamic>> services = [
    {"name": "Software Development", "image": "assets/images/logo.png", "price": "\$1200"},
    {"name": "SEO", "image": "assets/images/logo.png", "price": "\$800"},
    {"name": "Business Development", "image": "assets/images/logo.png", "price": "\$1000"},
    {"name": "Marketing Plan", "image": "assets/images/logo.png", "price": "\$500"},
    {"name": "Graphics and Motion Graphics", "image": "assets/images/logo.png", "price": "\$600"},
    {"name": "Branding and Promotion", "image": "assets/images/logo.png", "price": "\$700"},
    {"name": "Social Media Management", "image": "assets/images/logo.png", "price": "\$400"},
    {"name": "Training and Recruitment", "image": "assets/images/logo.png", "price": "\$900"},
    {"name": "Ads Problems & Online Securities", "image": "assets/images/logo.png", "price": "\$1000"},
    {"name": "Verification Badge", "image": "assets/images/logo.png", "price": "\$300"},
    {"name": "Recovery Hacked Data/Account", "image": "assets/images/logo.png", "price": "\$500"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services Offered",
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary,
                  fontSize: screenWidth > 600 ? 28 : 24,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  _showAllServicesBottomSheet(context);
                },
                icon: Icon(Icons.arrow_right_rounded, color: AppColors.primary, size: 18),
                label: Text(
                  "See All",
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backgroundLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: screenWidth > 600 ? 2.7 / 2 : 2.5 / 2,
            ),
            itemCount: 2, // Limit to 4 services for the overview
            itemBuilder: (context, index) {
              final service = services[index];
              return ServiceCard(
                serviceName: service['name'],
                imagePath: service['image'],
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAllServicesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: services.map((service) {
                    return ListTile(
                      leading: Image.asset(service['image'], width: 50, height: 50),
                      title: Text(service['name'], style: AppTextStyles.heading2),
                      subtitle: Text("Price: ${service['price']}", style: AppTextStyles.bodyText2),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String imagePath;

  const ServiceCard({
    required this.serviceName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Image as background
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // Glassy text overlay
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 8,
                child: Container(), // Empty container to push text to the bottom
              ),
              // Frosted glass effect for the text
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.2), // Semi-transparent background
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          serviceName,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyText1.copyWith(
                            color: AppColors.text,
                            fontSize: screenWidth > 600 ? 16 : 14,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: Colors.black54,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
