import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';

class RandomBarChartCard extends StatefulWidget {
  const RandomBarChartCard({super.key});

  @override
  State<RandomBarChartCard> createState() => _RandomBarChartCardState();
}

class _RandomBarChartCardState extends State<RandomBarChartCard> {
  List<BarChartGroupData> _barGroups = [];

  @override
  void initState() {
    super.initState();
    _loadChartWithAnimation();
  }

  void _loadChartWithAnimation() {
    // Start with zero-height bars
    _barGroups = List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: 0,
            color: primaryColor,
            width: 18.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
      );
    });

    setState(() {});

    // Animate in values after delay
    Future.delayed(const Duration(milliseconds: 300), () {
      final random = Random();
      final updatedBars = List.generate(7, (index) {
        final value = random.nextInt(20) + 5;
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              color: primaryColor,
              width: 18.w,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6.r),topRight: Radius.circular(6.r)),
            ),
          ],
        );
      });

      setState(() {
        _barGroups = updatedBars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10).h.w,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: const EdgeInsets.all(16).h.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📊 Weekly Report',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: _barGroups,
                  maxY: 30,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (value, _) => Text(
                          '${value.toInt()}',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) => Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'D${value.toInt() + 1}',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                ),
                swapAnimationDuration: const Duration(milliseconds: 800),
                swapAnimationCurve: Curves.easeOutBack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
