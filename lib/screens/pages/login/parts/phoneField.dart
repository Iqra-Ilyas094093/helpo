import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utilites/colors.dart';

class phoneField extends StatelessWidget {
  TextEditingController controller;
  phoneField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
        hintText: 'Enter Number',
        // hintStyle: TextStyle(color: secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        filled: true,

        suffixIcon: Icon(Icons.phone, color: secondaryColor),
        fillColor: Theme.of(context).colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }
}
