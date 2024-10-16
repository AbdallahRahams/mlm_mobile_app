import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneFieldWidget extends StatefulWidget {
  @override
  _PhoneFieldWidgetState createState() => _PhoneFieldWidgetState();
}

class _PhoneFieldWidgetState extends State<PhoneFieldWidget> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return _buildPhoneField();
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Fading gray background
        borderRadius: BorderRadius.circular(12), // Rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Subtle shadow for depth
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8), // Padding to avoid overflow
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline, // Aligns based on text baseline
        textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
        children: [
          Expanded(
            child: IntlPhoneField(
              showCursor: true,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.grey, // Color of label when inactive
                  fontSize: 14, // Smaller label size
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never, // Hide label when active
                border: InputBorder.none, // Remove border for unified look
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8), // Reduced padding
                filled: true,
                fillColor: Colors.transparent, // Blending with the container
                counterText: '', // Remove the default counter
              ),
              initialCountryCode: 'US', // Default selected country code
              onChanged: (phone) {
                setState(() {
                  phoneNumber = phone.number;
                });
                print(phone.completeNumber); // Full phone number with country code
              },
              style: TextStyle(
                fontSize: 14, // Smaller font size for phone number
                color: Color(0xFF224B42), // App's primary color for text
              ),
              dropdownTextStyle: TextStyle(
                fontSize: 14, // Smaller font size for country code
                color: Color(0xFF224B42), // App's primary color for dropdown text
              ),
              dropdownIcon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF224B42), // App's primary color for dropdown icon
                size: 18,
              ),
            ),
          ),
          SizedBox(width: 8), // Space between text field and character counter
          Align(
            alignment: Alignment.center, // Ensures text is centered vertically
            child: Text(
              '${phoneNumber.length}/10', // Show the number of characters entered
              style: TextStyle(
                fontSize: 14, // Font size for the character count
                color: Color(0xFF224B42), // App's primary color for text
              ),
            ),
          ),
        ],
      ),
    );
  }
}