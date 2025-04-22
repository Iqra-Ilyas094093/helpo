import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class registerField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData icon;
  registerField({super.key,required this.hintText,required this.icon,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: TextFormField(
        controller:  controller,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.h,),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          filled: true,
          suffixIcon: Icon(
            icon,
            color: secondaryColor,
          ),
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
