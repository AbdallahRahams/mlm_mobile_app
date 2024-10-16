import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteTheme,
          title: Text(
            'Change Password',
            style: AppTextStyles.heading2.copyWith(color: AppColors.primary),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  // Instruction Text
                  Center(
                    child: Text(
                      'Enter your current and new password below',
                      style: AppTextStyles.bodyText1.copyWith(
                        fontSize: screenHeight * 0.02,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Old Password Field
                  _buildStyledPasswordField(
                    controller: _oldPasswordController,
                    labelText: 'Old Password',
                    validator: _validatePassword,
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // New Password Field
                  _buildStyledPasswordField(
                    controller: _newPasswordController,
                    labelText: 'New Password',
                    validator: _validatePassword,
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Confirm New Password Field
                  _buildStyledPasswordField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm New Password',
                    validator: _validateConfirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Change Password Button
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleChangePassword,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Change Password',
                            style: AppTextStyles.button.copyWith(
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Password field widget
  Widget _buildStyledPasswordField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.primary),
        prefixIcon: Icon(Iconsax.lock, color: AppColors.primary),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  // Handle change password logic
  Future<void> _handleChangePassword() async {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _isLoading = true;
      });

      // Make a real API call
      bool isSuccessful = await _changePasswordAPI(
        _oldPasswordController.text,
        _newPasswordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (isSuccessful) {
        _showSuccessDialog();
      } else {
        _showErrorDialog();
      }
    }
  }

  // Real API call for changing password
  Future<bool> _changePasswordAPI(String oldPassword, String newPassword) async {
    const apiUrl = 'https://your-server-url.com/api/change-password'; // Replace with your real API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer your_token', // Add auth token if needed
        },
        body: jsonEncode({
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Successfully changed password
        return true;
      } else {
        // Handle error response
        return false;
      }
    } catch (error) {
      // Handle network error
      print("Error changing password: $error");
      return false;
    }
  }

  // Success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Password Changed"),
          content: Text("Your password has been successfully updated."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to the previous page
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Error dialog
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("There was an issue changing your password. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Password validation function
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Confirm password validation function
  String? _validateConfirmPassword(String? value) {
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}