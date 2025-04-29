import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/validators.dart';

import '../../../../utilites/colors.dart';

class passwordField extends StatefulWidget {
  FocusNode node1;
  FocusNode node2;
  String text;
  bool obscure;
  TextEditingController controller;
  passwordField({super.key,required this.controller,required this.obscure,required this.text,required this.node1,required this.node2,});

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: TextFormField(
        focusNode: widget.node1,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(widget.node2);
        },
        validator: validatePassword,
        obscureText: widget.obscure,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.h),
          hintText: widget.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          filled: true,
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              widget.obscure = !widget.obscure;
            });

          }, icon: Icon(widget.obscure?Icons.visibility_off_outlined:Icons.visibility_outlined)),
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
