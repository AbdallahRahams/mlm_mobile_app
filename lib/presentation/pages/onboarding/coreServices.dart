import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class CoreServicesPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {"title": "Software Development", "image": "assets/icons/development.png"},
    {"title": "SEO", "image": "assets/icons/seo.png"},
    {"title": "Digital Marketing", "image": "assets/icons/marketing.png"},
    {"title": "Consulting", "image": "assets/icons/consulting.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10), // Add proper vertical spacing

                // Carousel for Services with flexible width
                Container(
                  height: screenHeight * 0.5, // Adaptive height
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.85),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return _buildServiceCarouselCard(
                        services[index],
                        screenWidth,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Additional informative text or a CTA could be added here.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Explore our wide range of services that can help accelerate your business growth.",
                    style: AppTextStyles.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Carousel card builder
  Widget _buildServiceCarouselCard(Map<String, String> service, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          // Service card with image and title
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black.withOpacity(0.3),
            child: Container(
              width: screenWidth * 0.85, // Adaptive width based on screen size
              height: screenWidth * 0.65, // Maintain a good aspect ratio
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(service['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Title with dark overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        service['title']!,
                        style: AppTextStyles.heading21.copyWith(
                          letterSpacing: 1.1,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(1, 1),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Description below the card with spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "We offer professional ${service['title']} services to meet your needs.",
              style: AppTextStyles.subheading2.copyWith(
                color: AppColors.text,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}