import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/verification/parts/otpForm.dart';
import 'package:login_design/screens/pages/verification/parts/pinputform.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/parts/resendCode.dart';
import 'package:login_design/screens/pages/verification/parts/sentOTPcode.dart';
import 'package:login_design/screens/pages/verification/parts/topHeader.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class verificationScreen extends StatefulWidget {
  String trimEmail;
  verificationScreen({super.key,required this.trimEmail});

  @override
  State<verificationScreen> createState() => _verificationScreenState();
}

class _verificationScreenState extends State<verificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? _timer;
  int _start = 60; // countdown in seconds
  bool _canResendEmail = false;
  double _percent = 1.0;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }
  bool _checkEmailVerifiedPeriodically() {
    Timer.periodic(Duration(seconds: 3), (timer) async {
      await _auth.currentUser?.reload();
      if (_auth.currentUser?.emailVerified ?? false) {
        timer.cancel();
        setState(() {
          isVerified = true;
        });
        // or wherever
      }
    });
    return isVerified;
  }
  void _startCountdown() {
    setState(() {
      _canResendEmail = false;
      _start = 60;
      _percent = 1.0;
    });

    const oneSec = Duration(seconds: 1);
    _timer?.cancel(); // Cancel existing timer
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() {
          _canResendEmail = true;
        });
      } else {
        setState(() {
          _start--;
          _percent = _start / 60;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
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
                sentOTPcode(text: widget.trimEmail,),
                SizedBox(height: 30.h),
                resendCode(onPressed: (){_canResendEmail?sendVerificationEmail(context):null;},),
                SizedBox(height: 15.h),
                registerButton(
                  text: 'Register',
                  ontap: () async{
                    bool success =await _checkEmailVerifiedPeriodically();
                    if(success){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => homeScreen()),
                      );
                    }
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
