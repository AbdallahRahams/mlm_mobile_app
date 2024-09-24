import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../home/homePage.dart';

class MyWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('My Wallet', style: AppTextStyles.heading21),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Makes the content scrollable
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
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on, color: AppColors.secondary, size: 40),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            '\$1234.56', // Dynamic balance value here
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            overflow: TextOverflow.ellipsis, // Avoid text overflow
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
                    shrinkWrap: true, // Adjust size based on items
                    physics: NeverScrollableScrollPhysics(), // Disable internal scroll of ListView
                    children: [
                      _buildTransactionTile(
                        icon: Icons.add_circle_outline,
                        title: 'Deposit',
                        subtitle: 'Added \$100.00',
                        date: '2024-09-12',
                      ),
                      _buildTransactionTile(
                        icon: Icons.remove_circle_outline,
                        title: 'Withdraw',
                        subtitle: 'Removed \$50.00',
                        date: '2024-09-10',
                      ),
                      _buildTransactionTile(
                        icon: Icons.add_circle_outline,
                        title: 'Deposit',
                        subtitle: 'Added \$200.00',
                        date: '2024-09-08',
                      ),
                      // Add more transactions here
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Add Funds and Withdraw Buttons Section
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Handle Add Funds
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add Funds', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Handle Withdraw Funds
                        },
                        icon: Icon(Icons.remove),
                        label: Text('Withdraw Funds', style: TextStyle(fontSize: 16)),
                      ),
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
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.secondary, size: 30),
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