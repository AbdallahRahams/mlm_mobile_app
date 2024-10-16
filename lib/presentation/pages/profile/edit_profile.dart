import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Screen size for responsiveness

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: AppTextStyles.appBartext),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildEditableField("Username", "YourUsername", screenSize),
              _buildEditableField("Email", "email@example.com", screenSize),
              _buildEditableField("Mobile", "+255 765 094 XXX", screenSize),
              _buildEditableField("Date of Birth", "14th Oct, 2XXX", screenSize),
              SizedBox(height: screenSize.height * 0.04),
              _buildSaveButton(screenSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: screenSize.width * 0.04),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSaveButton(Size screenSize) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Logic to save profile changes
        },
        child: Text(
          'Save Changes',
          style: AppTextStyles.button.copyWith(
            fontSize: screenSize.width * 0.045, // Responsive button text
            color: AppColors.buttonText,
          ),
        ),
      ),
    );
  }
}
