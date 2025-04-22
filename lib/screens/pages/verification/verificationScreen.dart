import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/verification/parts/otpForm.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/parts/resendCode.dart';
import 'package:login_design/screens/pages/verification/parts/sentOTPcode.dart';
import 'package:login_design/screens/pages/verification/parts/topHeader.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class verificationScreen extends StatefulWidget {
  const verificationScreen({super.key});

  @override
  State<verificationScreen> createState() => _verificationScreenState();
}

class _verificationScreenState extends State<verificationScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  Timer? cooldownTimer;
  int cooldownSeconds = 60;
  int timeLeft = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
  }

  Future<bool> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.emailVerified) {
      setState(() {
        isEmailVerified = true;
      });
      timer?.cancel();
      cooldownTimer?.cancel();
    }
    return isEmailVerified;
  }
  void startCooldown() {
    setState(() {
      canResendEmail = false;
      timeLeft = cooldownSeconds;
    });

    cooldownTimer?.cancel();
    cooldownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) {
          canResendEmail = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    cooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double progress = timeLeft > 0
        ? (cooldownSeconds - timeLeft) / cooldownSeconds
        : 1.0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                topHeader(text: 'Verification'),
                SizedBox(height: 30.h),
                Text(
                  'Enter your\nVerification Code',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                otpForm(),
                SizedBox(height: 20.h),
                Text(
                  '02:00',
                  style: TextStyle(fontSize: 14.sp, color: primaryColor),
                ),
                SizedBox(height: 15.h),
                sentOTPcode(),
                SizedBox(height: 15.h),
                resendCode(onPressed: (){canResendEmail?sendVerificationEmail:null;},),
                SizedBox(height: 30.h),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 10.0,
                  percent: progress,
                  center: Text(
                    '$timeLeft',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: canResendEmail ? Colors.grey : primaryColor,
                ),
                SizedBox(height: 30.h),
                registerButton(
                  text: 'Register',
                  ontap: () async{
                    bool success =await checkEmailVerified();
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
