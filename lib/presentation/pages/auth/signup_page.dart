import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final List<String> countryCodes = ['+1', '+7', '+20', '+27', '+30', '+31', '+32', 
  '+33', '+34', '+36', '+39', '+40', '+41', '+43', '+44', '+45', '+46', '+47', '+48', 
  '+49', '+51', '+52', '+53', '+54', '+55', '+56', '+57', '+58', '+60', '+61', '+62', 
  '+63', '+64', '+65', '+66', '+81', '+82', '+84', '+86', '+90', '+91', '+92', '+93', 
  '+94', '+95', '+98', '+211', '+212', '+213', '+216', '+218', '+220', '+221', '+222', 
  '+223', '+224', '+225', '+226', '+227', '+228', '+229', '+230', '+231', '+232', '+233', 
  '+234', '+235', '+236', '+237', '+238', '+239', '+240', '+241', '+242', '+243', '+244', 
  '+245', '+246', '+248', '+249', '+250', '+251', '+252', '+253', '+254', '+255', '+256', 
  '+257', '+258', '+260', '+261', '+262', '+263', '+264', '+265', '+266', '+267', '+268', 
  '+269', '+290', '+291', '+297', '+298', '+299'];

  String selectedCountryCode = '+255';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
              ),
            ),
            Center(
              child: Text(
                'Join Us Today!',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary1,
                  fontSize: screenHeight * 0.035,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lora',
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Center(
              child: Text(
                'Create your account to get started',
                style: AppTextStyles.bodyText1.copyWith(
                  color: Colors.grey[600],
                  fontSize: screenHeight * 0.02,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            _buildTextField(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.person,
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildPhoneField(),
            SizedBox(height: screenHeight * 0.015),
            _buildPasswordTextField(),
            SizedBox(height: screenHeight * 0.015),
            _buildConfirmPasswordTextField(),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  Navigator.pushNamed(
                    context,
                    '/phone-verification',
                    arguments: '$selectedCountryCode${_phoneNumberController.text}',
                  );
                });
                _isLoading = false;
                BlocProvider.of<AuthBloc>(context).add(
                  AuthSignUpEvent(
                    username: _usernameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    phoneNumber: '$selectedCountryCode${_phoneNumberController.text}',
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: Text(
                'Sign Up',
                style: AppTextStyles.button.copyWith(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            if (_isLoading)
              const Column(
                children: [
                  LinearProgressIndicator(
                    backgroundColor: AppColors.background,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary1),
                  ),
                ],
              ),
            SizedBox(height: screenHeight * 0.02),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  setState(() {
                    _isLoading = false;
                  });
                  // Navigate to the next page
                } else if (state is AuthFailure) {
                  setState(() {
                    _isLoading = false;
                  });
                  // Show error message
                }
              },
              child: Container(),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Colors.black,
                    fontSize: screenHeight * 0.02,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: AppTextStyles.link.copyWith(
                        color: AppColors.primary1,
                        fontSize: screenHeight * 0.02,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/sign_in');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.primary1, fontSize: 14),
        prefixIcon: Icon(icon, color: AppColors.primary1),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
      ),
      cursorColor: AppColors.primary1,
      cursorWidth: 2,
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: DropdownButtonFormField<String>(
            value: selectedCountryCode,
            items: countryCodes.map((String code) {
              return DropdownMenuItem(
                value: code,
                child: Text(code, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.primary1)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedCountryCode = newValue!;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.secondary),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: _buildTextField(
            controller: _phoneNumberController,
            labelText: 'Phone Number',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.primary1, fontSize: 14),
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
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
      ),
      cursorColor: AppColors.primary1,
      cursorWidth: 2,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextField(
      controller: _confirmPasswordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.primary1, fontSize: 14),
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
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
      ),
      cursorColor: AppColors.primary1,
      cursorWidth: 2,
    );
  }
}
