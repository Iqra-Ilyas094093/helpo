import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class customizedTextField extends StatelessWidget {
  VoidCallback onPressIcon;
  IconData icon;
  FormFieldValidator<String> func;
  TextEditingController controller;
  customizedTextField({super.key,required this.icon,required this.controller,required this.onPressIcon,required this.func});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        validator: func,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8,left: 8),
          hintText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          filled: true,
          suffixIcon: IconButton(onPressed: onPressIcon, icon: Icon(icon)),
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(14.r)
          ),disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
        )
        ),
      ),
    );
  }
}
