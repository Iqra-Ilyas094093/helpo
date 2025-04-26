import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilites/colors.dart';

class resendCode extends StatelessWidget {
  VoidCallback onPressed;
  resendCode({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "didn't recieve the email? ",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: primaryColor,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            'Send again',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
