import 'package:flutter/material.dart';
import 'dart:async';
import '../../../app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation and set the visibility state
    _animationController.forward();
    setState(() {
      _visible = true;
    });

    // Schedule navigation after the splash screen animation
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');  // Change to your route
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,  // Background color of your app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo with scaling animation
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/images/logo.png',  // Your app's logo asset
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            
            // Animated opacity for the app title
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Text(
            "African Digital Marketing Argency",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
            ),
          ],
        ),
      ),
    );
  }
}
