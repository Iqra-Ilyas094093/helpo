import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class googleCard extends StatelessWidget {
  VoidCallback onPressed;
  googleCard({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset('assets/images/google.png')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Continue with Google',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
