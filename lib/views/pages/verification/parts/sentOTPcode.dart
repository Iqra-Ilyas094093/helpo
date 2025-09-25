import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class sentOTPcode extends StatelessWidget {
  String text;
  sentOTPcode({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      textAlign: TextAlign.start,
      TextSpan(
        //16 500
        text: "We've send a verification code to your email " ,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 16),
        children: <TextSpan>[
          TextSpan(
            text: '$text*********@gmail.com.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: primaryColor,
            ),
          ),
          TextSpan(
            text: 'You can check your inbox.',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 16)
          ),
        ],
      ),
    );
  }
}
