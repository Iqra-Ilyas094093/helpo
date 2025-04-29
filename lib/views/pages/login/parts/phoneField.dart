import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utilites/colors.dart';

class phoneField extends StatelessWidget {

  TextEditingController controller;
  phoneField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: "PK",
      dropdownTextStyle: GoogleFonts.poppins(
        color: Theme.of(context).brightness == Brightness.dark?Colors.white:Colors.black, // Apply country code color based on the theme
      ),
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
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r)
        )
      ),
    );
  }
}
