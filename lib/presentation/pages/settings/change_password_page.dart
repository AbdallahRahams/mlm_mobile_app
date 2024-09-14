import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For inputFormatter
import 'dart:async';  // For the delay
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08, // Dynamic padding for better responsiveness
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Icon(
                  Icons.lock_reset,
                  size: screenHeight * 0.12, // Scaled down icon size
                  color: AppColors.primary1,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Center(
                child: Text(
                  'Change Password',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary1,
                    fontSize: isSmallScreen ? 24 : 28, // Responsive text size
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Enter your current password and set a new password.',
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Colors.grey[600],
                    fontSize: isSmallScreen ? 14 : 16, // Responsive text size
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Old password input
              _buildPasswordField(
                controller: _oldPasswordController,
                labelText: 'Old Password',
                icon: Icons.lock,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),

              // New password input
              _buildPasswordField(
                controller: _newPasswordController,
                labelText: 'New Password',
                icon: Icons.lock_outline,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Confirm new password input
              _buildPasswordField(
                controller: _confirmPasswordController,
                labelText: 'Confirm New Password',
                icon: Icons.lock_outline,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.04),

              // Change password button
              ElevatedButton(
                onPressed: _isLoading ? null : _handleChangePassword,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.2,
                  ),
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _isLoading ? 'Changing...' : 'Change Password',
                  style: AppTextStyles.button.copyWith(
                    fontSize: isSmallScreen ? 14 : 16, // Responsive button text size
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Show loading indicator if applicable
              if (_isLoading)
                const LinearProgressIndicator(
                  backgroundColor: AppColors.background,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary1),
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required double screenWidth,
  }) {
    final isSmallScreen = screenWidth < 600;

    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText1.copyWith(
          color: AppColors.primary1,
          fontSize: isSmallScreen ? 14 : 16, // Responsive label size
        ),
        prefixIcon: Icon(icon, color: AppColors.primary1),
        filled: true,
        fillColor: AppColors.background,
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

  void _handleChangePassword() {
    setState(() {
      _isLoading = true;
    });

    // Mock a delay for password change (this should be replaced with the actual password change logic)
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });

      // Show success message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password Changed"),
            content: Text("Your password has been successfully updated."),
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