import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
  padding: EdgeInsets.only(top: screenHeight * 0.03),
  child: Container(
    height: screenHeight * 0.2,
    child: Image.asset(
      "assets/images/logo.png",
      fit: BoxFit.contain, // Ensure the image scales properly
    ),
  ),
),

              Center(
                child: Text(
                  'Welcome Back!',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary,
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lora',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Sign in to continue',
                  style: AppTextStyles.bodyText1.copyWith(
                    fontSize: screenHeight * 0.022,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Email Field
              _buildStyledTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.025),

              // Password Field
              _buildStyledPasswordTextField(),
              SizedBox(height: screenHeight * 0.03),

              // Sign In Button
              ElevatedButton(
                onPressed: _isLoading ? null : _handleSignIn,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        'Sign In',
                        style: AppTextStyles.button.copyWith(
                          fontSize: screenHeight * 0.022,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: AppTextStyles.bodyText1.copyWith(
                      color: Colors.black,
                      fontSize: screenHeight * 0.018,
                    ),
                    children: [
                      TextSpan(
                        text: " Sign Up",
                        style: AppTextStyles.link.copyWith(
                          color: AppColors.primary,
                          fontSize: screenHeight * 0.018,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ),

              Center(
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: 1,
            endIndent: 10, // space between divider and text
          ),
        ),
        Text(
          'or sign in with',
          style: AppTextStyles.bodyText1.copyWith(
            fontSize: screenHeight * 0.022, // Slightly increase font size
            color: Colors.grey[700],
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: 1,
            indent: 10, // space between text and divider
          ),
        ),
      ],
    ),
  ),
),

              SizedBox(height: screenHeight * 0.015),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialSignUpButton(
                    icon: FontAwesomeIcons.google,
                    label: 'Google',
                    onPressed: () {
                      // Add Google sign-up logic
                    },
                  ),
                  _buildSocialSignUpButton(
                    icon: FontAwesomeIcons.facebook,
                    label: 'Facebook',
                    onPressed: () {
                      // Add Facebook sign-up logic
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),


              if (_isLoading) ...[
                SizedBox(height: screenHeight * 0.02),
                LinearProgressIndicator(
                  backgroundColor: AppColors.background,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                SizedBox(height: screenHeight * 0.02),
                SpinKitThreeBounce(
                  color: AppColors.primary,
                  size: screenHeight * 0.05,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String labelText,
    required FormFieldValidator<String> validator,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          filled: true,
          fillColor: Colors.transparent,
        ),
        style: TextStyle(
          fontSize: 14,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildStyledPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primary,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          color: AppColors.primary,
        ),
      ),
    );
  }

   Widget _buildSocialSignUpButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust horizontal padding as needed
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          color: AppColors.primary,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: AppColors.primary),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
        ),
      ),
    ),
  );
}

  void _handleSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Implement sign-in logic here

      setState(() {
        _isLoading = false;
      });
    }
  }
}