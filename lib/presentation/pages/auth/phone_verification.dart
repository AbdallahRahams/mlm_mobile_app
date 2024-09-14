import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  PhoneVerificationPage({required this.phoneNumber});

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  int _secondsRemaining = 60;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 60;
    _canResend = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                child: Image.asset(
                  "assets/images/logo.png",
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Text(
                  'Verify your Phone',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary1,
                    fontFamily: 'Lora',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'We sent a verification code to',
                  style: AppTextStyles.bodyText1.copyWith(color: Colors.grey[600]),
                ),
              ),
              Center(
                child: Text(
                  widget.phoneNumber,
                  style: AppTextStyles.bodyText1.copyWith(color: AppColors.primary1),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              _buildCodeTextField(),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () {
                  // Add verification code logic here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Verify',
                  style: AppTextStyles.button.copyWith(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              _canResend
                  ? Center(
                      child: TextButton(
                        onPressed: () {
                          _startTimer();
                          // Add resend code logic here
                        },
                        child: Text(
                          'Resend Code',
                          style: AppTextStyles.link.copyWith(color: AppColors.primary1),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'Resend code in $_secondsRemaining seconds',
                        style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
                      ),
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

  Widget _buildCodeTextField() {
  return TextField(
    controller: _codeController,
    decoration: InputDecoration(
      labelText: 'Verification Code',
      labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.primary1),
      prefixIcon: Icon(Icons.lock, color: AppColors.primary1),
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
    keyboardType: TextInputType.number,
    cursorColor: AppColors.primary1,
    inputFormatters: [
      LengthLimitingTextInputFormatter(6), // Limit the input to 6 characters
      FilteringTextInputFormatter.digitsOnly, // Only allow digits
    ],
  );
}

}