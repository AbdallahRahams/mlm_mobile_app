import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../home/homePage.dart';

class MyWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, // Set app bar color
        title: Text('My Wallet', style: AppTextStyles.heading21),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Balance
              Text(
                'Wallet Balance',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.monetization_on, color: AppColors.secondary),
                  title: Text(
                    '\$1234.56', // Dynamic balance value here
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20),

              // Transaction History
              Text(
                'Transaction History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildTransactionTile(
                      icon: Icons.add,
                      title: 'Deposit',
                      subtitle: 'Added \$100.00',
                      date: '2024-09-12',
                    ),
                    _buildTransactionTile(
                      icon: Icons.remove,
                      title: 'Withdraw',
                      subtitle: 'Removed \$50.00',
                      date: '2024-09-10',
                    ),
                    _buildTransactionTile(
                      icon: Icons.add,
                      title: 'Deposit',
                      subtitle: 'Added \$200.00',
                      date: '2024-09-08',
                    ),
                    // Add more transactions here
                  ],
                ),
              ),
              
              SizedBox(height: 20),

              // Add Funds and Withdraw Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {
                      // Handle Add Funds
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Funds'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {
                      // Handle Withdraw Funds
                    },
                    icon: Icon(Icons.remove),
                    label: Text('Withdraw Funds'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each transaction item
  Widget _buildTransactionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: AppColors.secondary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(date, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
