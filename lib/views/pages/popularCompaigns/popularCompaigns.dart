import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/views/pages/home/home.dart';
import '../home/parts/helper.dart';

class Popularcompaigns extends StatelessWidget {
  const Popularcompaigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12.h,),
            Center(
              child: Text(
                'Popular Compaigns',
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
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // max width per item
                  childAspectRatio: 0.75, // Adjust as needed (1.0 = square, <1 = taller)
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return popular(image: images[index],text:description[index],descriptionText: descr[index],);
                },
              )

            )
          ],
        ),
      ),
    );
  }
}
