import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/presentation/pages/auth/signup_page.dart';
import '../../../app_colors.dart';
import 'communityTraining.dart';
import 'coreServices.dart';
import 'finalCallToAction.dart';
import 'solutionHighlight.dart';
import 'welcome.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  // List of onboarding pages
  final List<Widget> _pages = [
    WelcomePage(),
    SolutionHighlightPage(),
    CommunityTrainingPage(),
    FinalCallToActionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          _buildPageView(),
          _buildNavigationButtons(screenSize),
        ],
      ),
    );
  }

  // Build the PageView for onboarding pages
  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: _pages,
    );
  }

  // Build navigation buttons for Next, Skip, and dots aligned horizontally
  Widget _buildNavigationButtons(Size screenSize) {
    return Positioned(
      bottom: screenSize.height * 0.05, // Adjusting bottom spacing
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Only show Skip button if it's not the last page
          if (_currentIndex < _pages.length - 1)
            ElevatedButton(
              onPressed: _navigateToRegistration,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05, // Responsive padding
                  vertical: screenSize.height * 0.02, // Responsive padding
                ),
                textStyle: TextStyle(
                  fontSize: screenSize.width * 0.04, // Responsive text size
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("Skip"),
            ),
          // Only show dots if it's not the last page
          if (_currentIndex < _pages.length - 1)
            Row(
              children: List.generate(_pages.length, (index) => _buildDot(index)),
            ),
          // Next button on the right side
          _currentIndex < _pages.length - 1
              ? _navigationButton("Next", _goToNextPage, screenSize)
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  // Navigate to the registration screen
  void _navigateToRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()), // Replace with your actual registration screen
    );
  }

  // Create individual navigation buttons
  Widget _navigationButton(String text, VoidCallback onPressed, Size screenSize) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05, // Responsive padding
          vertical: screenSize.height * 0.02, // Responsive padding
        ),
        textStyle: TextStyle(
          fontSize: screenSize.width * 0.04, // Responsive text size
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }

  // Navigate to the next page
  void _goToNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Build a dot for the dots indicator
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: _currentIndex == index ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentIndex == index ? AppColors.primary : AppColors.text,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}