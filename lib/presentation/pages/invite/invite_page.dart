import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app_colors.dart'; // Make sure this is the correct path
import '../../../text_styles.dart'; // Make sure this is the correct path

class InvitePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  InvitePage() {
    _emailController.text = '';  // Default value for email, if any
    _messageController.text = 'Hi! I\'m using this amazing app, and I\'d love for you to try it out! Download it here: [link] and use my referral code: [referral code] when you sign up!';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, // Use your theme color
        title: Text('Invite', style: AppTextStyles.heading1.copyWith(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.02,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Send an Invite',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary,
                  fontSize: screenHeight * 0.025,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInviteOption(
                    context,
                    icon: Icons.email,
                    label: 'Email',
                    onTap: () => showInviteBottomSheet(context),
                  ),
                  _buildInviteOption(
                    context,
                    icon: Icons.phone,
                    label: 'Mobile Phone',
                    onTap: () => _showPhoneNumberPrompt(context),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                'Sent Invitations',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              Expanded(
                child: ListView(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInviteOption(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: AppColors.primary),
          SizedBox(height: 10),
          Text(label, style: AppTextStyles.bodyText1.copyWith(color: Colors.black)),
        ],
      ),
    );
  }

  void showInviteBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
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
                style: AppTextStyles.heading1.copyWith(
                  fontSize: screenHeight * 0.025,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField(
                context: context,
                controller: _emailController,
                labelText: 'Email Address',
                icon: Icons.email,
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTextField(
                context: context,
                controller: _messageController,
                labelText: 'Message (Optional)',
                icon: Icons.message,
                maxLines: 3,
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      ),
                      child: Text('Cancel', style: AppTextStyles.button.copyWith(fontSize: screenHeight * 0.02)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement send email logic here
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary, // Use your theme color
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      ),
                      child: Text('Send Invite', style: AppTextStyles.button.copyWith(fontSize: screenHeight * 0.02)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        );
      },
    );
  }

  void _showPhoneNumberPrompt(BuildContext context) {
    String phoneNumber = '';

    showDialog(
      context: context,
      builder: (_) {
        final screenHeight = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: Text('Enter Phone Number', style: AppTextStyles.heading1.copyWith(fontSize: screenHeight * 0.025)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: _buildTextField(
              context: context,
              controller: TextEditingController(),
              labelText: 'Phone Number',
              icon: Icons.phone,
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(backgroundColor: AppColors.primary),
              child: Text('Cancel', style: AppTextStyles.button.copyWith(fontSize: screenHeight * 0.02)),
            ),
            ElevatedButton(
              onPressed: () {
                _sendSMSInvite(phoneNumber);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary, // Use your theme color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Send Invite', style: AppTextStyles.button.copyWith(fontSize: screenHeight * 0.02)),
            ),
          ],
        );
      },
    );
  }

  void _sendSMSInvite(String phoneNumber) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': 'Hi, check out this amazing app! Use my referral link: [link]',
      },
    );

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      print('Could not launch SMS');
    }
  }

  Widget _buildSentInviteTile({
    required String identifier,
    required String status,
    required String date,
  }) {
    return ListTile(
      leading: Icon(
        identifier.contains('@') ? Icons.email : Icons.phone,
        color: AppColors.primary,
      ),
      title: Text(identifier, style: AppTextStyles.bodyText1.copyWith(color: Colors.black)),
      subtitle: Text('Status: $status', style: AppTextStyles.bodyText1.copyWith(color: Colors.grey)),
      trailing: Text(date, style: AppTextStyles.bodyText1.copyWith(color: Colors.grey)),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    void Function(String)? onChanged,
    int maxLines = 1,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.primary),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
