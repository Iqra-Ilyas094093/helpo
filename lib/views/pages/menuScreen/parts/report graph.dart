import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimplePieChartWidget extends StatelessWidget {
  const SimplePieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          // width: 300, // Set a fixed size for the chart
          height: 300, // Set a fixed size for the chart
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(value: 40, color: Colors.blue, title: '40%'),
                PieChartSectionData(value: 30, color: Colors.green, title: '30%'),
                PieChartSectionData(value: 20, color: Colors.orange, title: '20%'),
                PieChartSectionData(value: 10, color: Colors.red, title: '10%'),
              ],
              borderData: FlBorderData(show: false),
              sectionsSpace: 0, // No space between the sections
              centerSpaceRadius: 0, // No center space
            ),
          ),
        ),
      );
  }
}
