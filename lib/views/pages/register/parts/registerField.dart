import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilites/colors.dart';

class registerField extends StatelessWidget {

  FocusNode node1;
  FocusNode node2;
  TextEditingController controller;
  String hintText;
  IconData icon;
 FormFieldValidator<String> validator;
  registerField(
      {super.key, required this.hintText, required this.icon, required this.controller,required this.validator,required this.node1,required this.node2,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextFormField(
        focusNode: node1,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(node2);
        },
        validator: validator,
      controller: controller,
      textAlign: TextAlign.left,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h,),
          hintText: hintText,
          isDense: true,
          errorStyle: TextStyle(height: 0),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          ),
          filled: true,
          suffixIcon: Icon(icon),
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: primaryColor, width: 2),
          ),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r))
          ),
          ),
    );
  }
}
