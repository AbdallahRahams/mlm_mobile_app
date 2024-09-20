import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/presentation/widgets/customCards.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widgets/earnings.dart'; // For graphs

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
        title: Text("Earnings", style: AppTextStyles.heading2.copyWith(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting and Total Earnings
              _buildGreetingSection(),

              // Total Earnings Card
              _buildEarningsOverviewCard(),

              const SizedBox(height: 20),

              // Earnings Breakdown (Graph and Filters)
              _buildEarningsChart(),

              const SizedBox(height: 20),

              // Recent Transactions Section
              _buildRecentTransactionsSection(),

              const SizedBox(height: 20),

              // Bonuses and Commissions Breakdown
              _buildBonusesSection(),
              _buildCommissionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Greeting Section
  Widget _buildGreetingSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hello, ',
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.secondary,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'Username', // Replace with dynamic username
                  style: AppTextStyles.heading2.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Icon(Iconsax.dollar_circle, size: 30, color: AppColors.primary),
        ],
      ),
    );
  }

  // Total Earnings Overview Card
  Widget _buildEarningsOverviewCard() {
    return EarningsCustomCard(
      title: "Total Earnings",
      subtitle: "Your cumulative earnings",
      value: "\$${totalEarnings.toStringAsFixed(2)}",
      icon: Iconsax.wallet_2,
      color: AppColors.primary,
    );
  }

  // Earnings Chart Section
  Widget _buildEarningsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Earnings Over Time", style: AppTextStyles.heading3),
        const SizedBox(height: 10),
        Container(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
  spots: [
    FlSpot(0, 1000),
    FlSpot(1, 1500),
    FlSpot(2, 2000),
    FlSpot(3, 4000),
    FlSpot(4, 7000),
    FlSpot(5, 10000),
  ],
  isCurved: true,
  barWidth: 3,
  color: AppColors.primary, // Use 'color' for single color
),

              ],
            ),
          ),
        ),
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
        _buildTransactionCard("Commission", "\$200", "2024-09-15"),
        _buildTransactionCard("Bonus", "\$500", "2024-09-12"),
        _buildTransactionCard("Sale", "\$100", "2024-09-10"),
      ],
    );
  }

  // Individual Transaction Card
  Widget _buildTransactionCard(String title, String amount, String date) {
    return ListTile(
      leading: Icon(Iconsax.receipt_2, color: AppColors.secondary),
      title: Text(title, style: AppTextStyles.bodyText1),
      subtitle: Text(date, style: AppTextStyles.bodyText2),
      trailing: Text(amount, style: AppTextStyles.heading3.copyWith(color: AppColors.primary)),
    );
  }

  // Bonuses Breakdown Section
  Widget _buildBonusesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bonuses", style: AppTextStyles.heading3),
        const SizedBox(height: 10),
        _buildEarningsDetailCard("Total Bonuses", "\$${totalBonuses.toStringAsFixed(2)}"),
      ],
    );
  }

  // Commissions Breakdown Section
  Widget _buildCommissionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Commissions", style: AppTextStyles.heading3),
        const SizedBox(height: 10),
        _buildEarningsDetailCard("Total Commissions", "\$${totalCommissions.toStringAsFixed(2)}"),
      ],
    );
  }

  // Earnings Detail Card
  Widget _buildEarningsDetailCard(String title, String value) {
    return EarningsCustomCard(
      title: title,
      subtitle: "Details",
      value: value,
      icon: Iconsax.chart_2,
      color: AppColors.secondary,
    );
  }
}
