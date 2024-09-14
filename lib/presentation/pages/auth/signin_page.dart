import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // Add this for the bouncing effect
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08,
            vertical: screenHeight * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.08),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                ),
              ),
              Center(
                child: Text(
                  'Welcome Back!',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary1,
                    fontSize: screenHeight * 0.035,  // Dynamic font size
                    fontFamily: 'Lora',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Center(
                child: Text(
                  'Sign in to continue',
                  style: AppTextStyles.bodyText1.copyWith(
                    fontSize: screenHeight * 0.02,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(
                controller: _usernameController,
                labelText: 'Username',
                icon: Icons.person,
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildPasswordTextField(),
              SizedBox(height: screenHeight * 0.025),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Forgot your password? ",
                    style: AppTextStyles.bodyText1.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Reset here",
                        style: AppTextStyles.link.copyWith(color: AppColors.primary1),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthSignInEvent(
                      _usernameController.text,
                      _passwordController.text,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: AppTextStyles.button.copyWith(
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              
              // Show Loading Bar when logging in
              if (_isLoading)
                Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: AppColors.background,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary1),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SpinKitThreeBounce(
                      color: AppColors.primary1,
                      size: screenHeight * 0.05,
                    ),
                  ],
                ),
              
              SizedBox(height: screenHeight * 0.03),
              
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    setState(() {
                      _isLoading = false;
                    });
                  } else if (state is AuthFailure) {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                child: Container(),
              ),
              
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyles.bodyText1.copyWith(
                      color: Colors.black,
                      fontSize: screenHeight * 0.018,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: AppTextStyles.link.copyWith(
                          color: AppColors.primary1,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText1.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.02,
          color: AppColors.primary1,
        ),
        prefixIcon: Icon(icon, color: AppColors.primary1),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
      cursorWidth: 2,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: AppTextStyles.bodyText1.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.02,
          color: AppColors.primary1,
        ),
        prefixIcon: Icon(Icons.lock, color: AppColors.primary1),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.primary1,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
      cursorWidth: 2,
    );
  }
}
