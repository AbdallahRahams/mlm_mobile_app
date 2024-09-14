import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For inputFormatter
import 'dart:async';  // For the delay
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Icon(
                  Icons.lock,
                  size: screenHeight * 0.15, // Reduced icon size
                  color: AppColors.primary1,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Enter your email address to receive a password reset link.',
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // Email input field
              _buildTextField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: _isLoading ? null : _handlePasswordReset,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _isLoading ? 'Sending...' : 'Send Reset Link',
                  style: AppTextStyles.button,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              if (_isLoading)
                Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: AppColors.background,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary1),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: AppColors.primary1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),  // Square with circular borders
        ),
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText1.copyWith(
          color: AppColors.primary1,
        ),
        prefixIcon: Icon(icon, color: AppColors.primary1),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
      ),
      cursorColor: AppColors.primary1,
    );
  }

  void _handlePasswordReset() {
    setState(() {
      _isLoading = true;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Check your email"),
            content: Text("A password reset link has been sent to ${_emailController.text}. Please check your inbox."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }
}
