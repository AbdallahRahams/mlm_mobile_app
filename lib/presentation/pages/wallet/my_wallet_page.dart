import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../home/homePage.dart';

class MyWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        backgroundColor: AppColors.whiteTheme,
        title: Text('My Wallet', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wallet Balance Section
                Text(
                  'Wallet Balance',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.cards,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Iconsax.money, color: AppColors.secondary, size: 40),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            '\$1234.56', // Dynamic balance value here
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Transaction History Section
                Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 10),

                // Ensure ListView is constrained to avoid overflow
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4, // Limit ListView height
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildTransactionTile(
                        icon: Iconsax.add_circle, // Green icon for deposit
                        title: 'Deposit',
                        subtitle: 'Added \$100.00',
                        date: '2024-09-12',
                        iconColor: Colors.green, // Set green color for deposit icon
                      ),
                      _buildTransactionTile(
                        icon: Iconsax.minus_cirlce, // Gray icon for withdraw
                        title: 'Withdraw',
                        subtitle: 'Removed \$50.00',
                        date: '2024-09-10',
                        iconColor: Colors.grey, // Set gray color for withdraw icon
                      ),
                      _buildTransactionTile(
                        icon: Iconsax.add_circle,
                        title: 'Deposit',
                        subtitle: 'Added \$200.00',
                        date: '2024-09-08',
                        iconColor: Colors.green,
                      ),
                      // Add more transactions here
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Add Funds and Withdraw Buttons Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Handle Add Funds
                      },
                      child: Text('Add Funds', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Handle Withdraw Funds
                      },
                      child: Text('Withdraw Funds', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
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
    required Color iconColor,
  }) {
    return Card(
      color: AppColors.cards,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 30), // Use the provided icon color
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        trailing: Text(
          date,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}