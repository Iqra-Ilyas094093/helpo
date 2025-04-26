import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class divider extends StatelessWidget {
  const divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: secondaryColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
          child: Text(
            //20 500
            'or',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w500)
          ),
        ),
        Expanded(child: Divider(color: secondaryColor)),
      ],
    );
  }
}
