import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart';
import 'earnings_chart.dart';

class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  // Temporary placeholders for data
  double totalEarnings = 15000.00;
  double totalCommissions = 1200.00;
  double totalBonuses = 3000.00;
  double totalSales = 700.00;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Earnings", style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting and total earnings display
              _buildGreetingSection(),
              const SizedBox(height: 20),

              // Earnings chart graph
              EarningsChart(),

              const SizedBox(height: 30),

              // Recent Transactions section
              _buildRecentTransactionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Greeting Section: Hello, Username, and Icon
  Widget _buildGreetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hello, ',
                style: AppTextStyles.heading2.copyWith(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              TextSpan(
                text: 'Username',  // Replace with dynamic username
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.primary,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
        Icon(Iconsax.dollar_circle, size: 30, color: AppColors.primary),
      ],
    );
  }

  // Recent Transactions Section
  Widget _buildRecentTransactionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Transactions", style: AppTextStyles.heading3),
        const SizedBox(height: 10),
        _buildTransactionRow("Commission", "\$200", "2024-09-15"),
        _buildTransactionRow("Bonus", "\$500", "2024-09-12"),
        _buildTransactionRow("Sale", "\$100", "2024-09-10"),
      ],
    );
  }

  // Transaction Row Widget for each transaction
  Widget _buildTransactionRow(String title, String amount, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.bodyText1),
              const SizedBox(height: 5),
              Text(date, style: AppTextStyles.bodyText2.copyWith(color: Colors.grey)),
            ],
          ),
          Text(amount, style: AppTextStyles.heading3.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}