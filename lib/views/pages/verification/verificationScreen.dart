
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/views/pages/verification/parts/pinputform.dart';
import 'package:login_design/views/pages/verification/parts/registerButton.dart';
import 'package:login_design/views/pages/verification/parts/resendCode.dart';
import 'package:login_design/views/pages/verification/parts/sentOTPcode.dart';
import 'package:provider/provider.dart';
import '../../../view_models/auth_view_model.dart';
import '../login/parts/topheader.dart';

class verificationScreen extends StatefulWidget {
  verificationScreen({super.key,});
  @override
  State<verificationScreen> createState() => _verificationScreenState();
}

class _verificationScreenState extends State<verificationScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                topHeader(text: 'Verification'),
                SizedBox(height: 30.h),
                Text(
                  'Enter your\nVerification Code',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),
                otpPinPut(otpController: otpController),
                SizedBox(height: 30.h),
                Text(
                  '02:00',
                  style: TextStyle(fontSize: 14.sp, color: primaryColor),
                ),
                SizedBox(height: 10.h),
                sentOTPcode(text:'user',),
                SizedBox(height: 30.h),
                resendCode(onPressed: (){},),
                SizedBox(height: 15.h),
                registerButton(
                  text: 'Register',
                  ontap: () async{
                    Map data = {
                      "otp": otpController.text,
                      "user_id": 18,
                    };
                    authViewModel.otpVerificationApi(data, context);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
