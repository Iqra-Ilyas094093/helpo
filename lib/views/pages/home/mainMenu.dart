import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/views/pages/home/parts/helper.dart';
import 'package:login_design/views/pages/verification/parts/registerButton.dart';

import 'donateAmount.dart';

class mainMenu extends StatelessWidget {
  final String image;
  final String title;
  final String descriptionText;
  mainMenu({super.key, required this.image, required this.title, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                color: primaryColor,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(image,fit: BoxFit.cover,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color:primaryColor ,)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8,left: 12,right: 12 ).w.h,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12).h.w,
              child: Row(
                children: [
                  Text(
                    "\$4,345 ",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      // color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    "fund raised from",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    " \$9,000",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      // color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: 0.5,
              onChanged: (onChanged) {},
              thumbColor: primaryColor,
              activeColor: primaryColor,
              inactiveColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4,882 donators",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      // color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    "4 days left",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      // color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
              child: Text(
                descriptionText,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  // color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12).h.w,
        child: registerButton(text: 'Donate Now', ontap: (){
          Navigator.pushNamed(context, RoutesName.donateAmount);
        }),
      ),
    );
  }
}
