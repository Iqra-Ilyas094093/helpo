import 'package:flutter/material.dart';
import 'package:login_design/screens/pages/verification/routes/routes.dart';

showSnackbar(context, String text) {
  final snackbar = SnackBar(
    content: SizedBox(
      height: 35.h,
      child: Text(
        text,
        style: TextStyle(
          color: fillColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 2,
      ),
    ),
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
    margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
    backgroundColor: primaryColor,
    behavior: SnackBarBehavior.floating,
    elevation: 30,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
