import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../app_colors.dart';

class EarningsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Earnings Over Time", style: AppTextStyles.heading3),
        const SizedBox(height: 10),
        Container(
          height: 300,  // Increased height
          width: double.infinity,  // Full-width for robustness
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),  // Background color
            borderRadius: BorderRadius.circular(12),  // Rounded container corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),  // Subtle shadow
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),  // Shadow position
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),  // Padding inside container
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),  // Hide grid lines
              axisLine: AxisLine(width: 0),  // Hide axis line
              labelStyle: TextStyle(color: AppColors.text),  // Customize label style
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),  // Hide grid lines
              labelStyle: TextStyle(color: AppColors.text),  // Customize Y-axis labels
              isVisible: true,
              axisLine: AxisLine(width: 0),  // Hide axis line
            ),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: getEarningsData(),
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.earnings,
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(5),
                ),  // Rounded top corners only
                width: .8,  // Adjust width for robust appearance
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Sample data
  List<ChartData> getEarningsData() {
    return [
      ChartData('Jan', 1000),
      ChartData('Feb', 1500),
      ChartData('Mar', 2000),
      ChartData('Apr', 4000),
      ChartData('May', 7000),
      ChartData('Jun', 10000),
    ];
  }
}

// Data model for the chart
class ChartData {
  final String month;
  final double earnings;

  ChartData(this.month, this.earnings);
}