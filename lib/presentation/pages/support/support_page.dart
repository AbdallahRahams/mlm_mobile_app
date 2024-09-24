import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app_colors.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support',
          style: AppTextStyles.appBartext,
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left, color: AppColors.secondary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Support Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We are here to help you with any inquiries. Feel free to reach out to us through any of the following methods:',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 20),
            ContactDetail(
              icon: Iconsax.message,
              label: 'Email',
              detail: 'support@adma.com',
              onPressed: () => launchUrl('mailto:support@adma.com'),
            ),
            ContactDetail(
              icon: Iconsax.call,
              label: 'Phone',
              detail: '+255 676 849 705',
              onPressed: () => launchUrl('tel:+255676849705'),
            ),
            ContactDetail(
              icon: Iconsax.call,
              label: 'Phone',
              detail: '+255 612 834 684',
              onPressed: () => launchUrl('tel:+255612834684'),
            ),
            ContactDetail(
              icon: Iconsax.messages4,
              label: 'Live Chat (WhatsApp)',
              detail: '+255 612 834 684',
              onPressed: () => launchUrl('https://wa.me/255612834684'),
            ),
            SizedBox(height: 30),
            Text(
              'Or, leave us a message:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 10),
            _ContactForm(),
          ],
        ),
      ),
    );
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ContactDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String detail;
  final VoidCallback onPressed;

  ContactDetail({
    required this.icon,
    required this.label,
    required this.detail,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        detail,
        style: TextStyle(color: AppColors.text),
      ),
      onTap: onPressed,
    );
  }
}

// Contact Form for additional support
class _ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          cursorColor: AppColors.primary, // Cursor in primary color
          decoration: InputDecoration(
            labelText: 'Your Name',
            labelStyle: TextStyle(color: AppColors.primary), // Label in primary color
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          cursorColor: AppColors.primary, // Cursor in primary color
          decoration: InputDecoration(
            labelText: 'Your Message',
            labelStyle: TextStyle(color: AppColors.primary), // Label in primary color
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2.0,
              ),
            ),
          ),
          maxLines: 4,
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity, // Full-width button
          child: ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16), // Padding for better touch area
            ),
            child: Text(
              'Send Message',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}