import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../app_colors.dart';
import '../../../text_styles.dart';

class InvitePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  InvitePage() {
    _emailController.text = '';
    _messageController.text =
        'Hi! I\'m using this amazing app, and I\'d love for you to try it out! Download it here: [link] and use my referral code: [referral code] when you sign up!';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        backgroundColor: AppColors.whiteTheme,
        title: Text('Invite', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.09),
              // Displaying the invite image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Image.asset(
                  'assets/images/invite.png', // Make sure the path matches the asset path in pubspec.yaml
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAssistantDetails(screenHeight),
                    SizedBox(height: screenHeight * 0.02),
                    _buildInviteButtons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Assistant Details Section
  Widget _buildAssistantDetails(double screenHeight) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to Invite Friends',
            style: AppTextStyles.heading1.copyWith(
              color: AppColors.primary,
              fontSize: screenHeight * 0.03,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    StylishListItem(
      text: 'You can invite friends via SMS or Email.',
      color: AppColors.primary,
    ),
    StylishListItem(
      text: 'Simply click on one of the options to send an invitation.',
      color: AppColors.primary,
    ),
    StylishListItem(
      text: 'Customize your message if you want, and share it instantly.',
      color: AppColors.primary,
    ),
  ],
),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }

  // Invite Buttons
  Widget _buildInviteButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            icon: Icon(Iconsax.call, color: Colors.white),
            label: Text('Use SMS', style: AppTextStyles.button),
            onPressed: () => _showPhoneNumberPrompt(context),
          ),
        ),
        SizedBox(width: 10), // Added space between buttons to avoid overlap
        Flexible(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            icon: Icon(Iconsax.sms, color: Colors.white),
            label:
                Text('Use Email', style: AppTextStyles.button),
            onPressed: () => showInviteBottomSheet(context),
          ),
        ),
      ],
    );
  }

  // Bottom sheet for email invite
  void showInviteBottomSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Send Invite via Email',
                  style: AppTextStyles.heading1
                      .copyWith(fontSize: screenHeight * 0.025),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildTextField(
                  context: context,
                  controller: _emailController,
                  labelText: 'Email Address',
                  icon: Iconsax.sms,
                ),
                SizedBox(height: screenHeight * 0.015),
                _buildTextField(
                  context: context,
                  controller: _messageController,
                  labelText: 'Message (Optional)',
                  icon: Iconsax.message,
                  maxLines: 3,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildButtonRow(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    int maxLines = 1,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showPhoneNumberPrompt(BuildContext context) {
    String phoneNumber = '';
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Enter Phone Number', style: AppTextStyles.heading2),
          content: _buildTextField(
            context: context,
            controller: TextEditingController(),
            labelText: 'Phone Number',
            icon: Iconsax.call,
            onChanged: (value) {
              phoneNumber = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',
                  style:
                      AppTextStyles.button.copyWith(color: AppColors.primary)),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () {
                if (_isValidPhoneNumber(phoneNumber)) {
                  _sendSMSInvite(phoneNumber);
                  Navigator.pop(context);
                } else {
                  _showError(context, 'Invalid phone number');
                }
              },
              child: Text('Send Invite', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
  }

  void _sendSMSInvite(String phoneNumber) {
    // Code to send SMS invite goes here
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () => _sendEmailInvite(context),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text('Send Invite', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _sendEmailInvite(BuildContext context) {
    // Code to send email invite goes here
  }
}

// Custom Stylish List Item Widget
class StylishListItem extends StatelessWidget {
  final String text;
  final Color color;

  StylishListItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0), // Space between items
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ', // Bullet point
            style: TextStyle(
              fontSize: 20, // Larger size for bullet
              color: color,  // Matches the color of the text
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyText1.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}