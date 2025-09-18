import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/views/pages/menuScreen/parts/RandomBarChart.dart';
import 'package:login_design/views/pages/menuScreen/parts/card.dart';
import 'package:login_design/views/pages/menuScreen/parts/report%20graph.dart';

class menuScreen extends StatelessWidget {
  const menuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h,),
            Center(
              child: Text(
                'My Cards',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(color: Colors.grey.shade500,),
            ),
            SizedBox(height: 12.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12).h.w,
              child: CreditCardWidget(),
            ),
            RandomBarChartCard(),
            // SimplePieChartWidget()
          ],
        ),
      ),
    ),);
  }
}
