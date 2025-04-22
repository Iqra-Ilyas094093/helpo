import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class customizedTextField extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  customizedTextField({super.key,required this.icon,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '',
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
