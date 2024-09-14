import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NetworkGrowthChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Network Growth',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 5),
                        FlSpot(3, 7),
                        FlSpot(4, 10),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  gridData: FlGridData(show: false), // Hide grid lines
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide bottom titles
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide left titles
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}