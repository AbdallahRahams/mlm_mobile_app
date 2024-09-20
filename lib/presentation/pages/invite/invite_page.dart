import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iconsax/iconsax.dart'; // Import Iconsax

import '../../../app_colors.dart'; // Ensure correct path
import '../../../text_styles.dart'; // Ensure correct path

class InvitePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  InvitePage() {
    _emailController.text = '';  // Default email value
    _messageController.text =
        'Hi! I\'m using this amazing app, and I\'d love for you to try it out! Download it here: [link] and use my referral code: [referral code] when you sign up!';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Invite', style: AppTextStyles.appBartext),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary), // Using Iconsax
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite Friends',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary,
                  fontSize: screenHeight * 0.03,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              
              // Invite Options (Using Flexible Grid)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInviteOption(
                    context,
                    icon: Iconsax.sms, // Using Iconsax
                    label: 'Email',
                    onTap: () => showInviteBottomSheet(context),
                  ),
                  _buildInviteOption(
                    context,
                    icon: Iconsax.call, // Using Iconsax
                    label: 'Mobile Phone',
                    onTap: () => _showPhoneNumberPrompt(context),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),

              // Sent Invitations Heading
              Text(
                'Sent Invitations',
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.primary,
                  fontSize: screenHeight * 0.025,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              
              // List of Sent Invitations (Taking up remaining screen space)
              Expanded(
                child: _buildSentInvitesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Invite Options using buttons
  Widget _buildInviteOption(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary.withOpacity(0.2),
              child: Icon(icon, size: 35, color: AppColors.primary),
            ),
            SizedBox(height: 10),
            Text(label, style: AppTextStyles.bodyText1.copyWith(color: AppColors.text)),
          ],
        ),
      ),
    );
  }

  // List of sent invitations
  Widget _buildSentInvitesList() {
    return ListView(
      children: [
        _buildSentInviteTile(
          identifier: 'example1@example.com',
          status: 'Pending',
          date: '2024-09-12',
        ),
        _buildSentInviteTile(
          identifier: '+255234567890',
          status: 'Accepted',
          date: '2024-09-10',
        ),
      ],
    );
  }

  Widget _buildSentInviteTile({required String identifier, required String status, required String date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            identifier.contains('@') ? Iconsax.sms : Iconsax.call, // Iconsax here
            color: AppColors.primary,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(identifier, style: AppTextStyles.bodyText1),
                Text('Status: $status', style: AppTextStyles.bodyText2.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          Text(date, style: AppTextStyles.bodyText2.copyWith(color: Colors.grey)),
        ],
      ),
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
        return Padding(
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
                style: AppTextStyles.heading1.copyWith(fontSize: screenHeight * 0.025),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField(
                context: context,
                controller: _emailController,
                labelText: 'Email Address',
                icon: Iconsax.sms, // Iconsax
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTextField(
                context: context,
                controller: _messageController,
                labelText: 'Message (Optional)',
                icon: Iconsax.message, // Iconsax
                maxLines: 3,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonRow(context),
            ],
          ),
        );
      },
    );
  }

  // Reusable Text Field widget
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

  // Phone number prompt dialog
  void _showPhoneNumberPrompt(BuildContext context) {
    String phoneNumber = '';
    showDialog(
      context: context,
      builder: (_) {
        final screenHeight = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: Text('Enter Phone Number', style: AppTextStyles.heading2.copyWith(fontSize: screenHeight * 0.025)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: _buildTextField(
              context: context,
              controller: TextEditingController(),
              labelText: 'Phone Number',
              icon: Iconsax.call, // Iconsax
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: AppTextStyles.button.copyWith(color: AppColors.primary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Button color
              ),
              onPressed: () {
                _sendSMSInvite(phoneNumber);
                Navigator.pop(context);
              },
              child: Text('Send Invite', style: AppTextStyles.button.copyWith(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  // Function to send SMS Invite
  void _sendSMSInvite(String phoneNumber) {
    // Logic to send SMS invite
    print('Sending SMS invite to $phoneNumber');
  }

  // Button row in bottom sheet
  Widget _buildButtonRow(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: AppTextStyles.button.copyWith(color: AppColors.primary)),
          ),
        ),
        SizedBox(width: screenHeight * 0.02),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // Button color
            ),
            onPressed: () {
              print('Sending Invite...');
              Navigator.pop(context);
            },
            child: Text('Send Invite', style: AppTextStyles.button.copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}