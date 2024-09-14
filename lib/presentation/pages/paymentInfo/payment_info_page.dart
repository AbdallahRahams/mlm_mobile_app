import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart'; // Import your custom colors

class PaymentInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, // Set app bar color
        title: Text('Payment Info', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section for saved payment methods
              Text(
                'Saved Payment Methods',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              // Placeholder for card details
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.credit_card, color: AppColors.secondary),
                  title: Text('Visa **** 1234'),
                  subtitle: Text('Expires 01/24'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: AppColors.primary),
                    onPressed: () {
                      // Handle card edit
                    },
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Section for adding new payment method
              Text(
                'Add Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              // Add new card or method button
              ListTile(
                leading: Icon(Icons.add, color: AppColors.primary),
                title: Text(
                  'Add New Card',
                  style: TextStyle(color: AppColors.primary),
                ),
                onTap: () {
                  // Handle add new payment method
                },
              ),
              Divider(),

              // Add PayPal or other methods
              ListTile(
                leading: Icon(Icons.paypal, color: AppColors.primary),
                title: Text(
                  'Add PayPal',
                  style: TextStyle(color: AppColors.primary),
                ),
                onTap: () {
                  // Handle add PayPal
                },
              ),
              Divider(),

              // Option for alternative payment method
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: AppColors.primary),
                title: Text(
                  'Add Bank Account',
                  style: TextStyle(color: AppColors.primary),
                ),
                onTap: () {
                  // Handle add bank account
                },
              ),

              SizedBox(height: 30),

              // Save Changes Button
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Handle save changes
                  },
                  icon: Icon(Icons.save),
                  label: Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
