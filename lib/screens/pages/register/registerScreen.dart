import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/login/parts/divider.dart';
import 'package:login_design/screens/pages/login/parts/googleCard.dart';
import 'package:login_design/screens/pages/register/parts/registerField.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/parts/topHeader.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/screens/pages/wrapper/wrapper.dart';
import 'package:login_design/utilites/colors.dart';

import '../homeScreen/homeScreen.dart';

class registerScreen extends StatelessWidget {
  registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 29.h),
                topHeader(text: 'Register'),
                SizedBox(height: 35.h),
                Text(
                  "Let's Get Started ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 19.sp,
                  ),
                ),
                Text(
                  "Create new Account",
                  style: TextStyle(fontSize: 16.sp, color: secondaryColor),
                ),
                SizedBox(height: 20.h),
                registerField(
                  controller: usernameController,
                  hintText: 'Enter Name',
                  icon: Icons.person_2_outlined,
                ),
                SizedBox(height: 18.h),
                registerField(
                  controller: emailController,
                  hintText: 'Enter Email',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 18.h),
                registerField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                  icon: Icons.remove_red_eye_sharp,
                ),
                SizedBox(height: 18.h),
                registerField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  icon: Icons.remove_red_eye_sharp,
                ),
                SizedBox(height: 18.h),
                registerButton(
                  text: 'Register',
                  ontap: () async {
                    if(passwordController.text == confirmPasswordController.text){
                      final success = await register(context, emailController.text, passwordController.text);
                      if(success){
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 100),
                            pageBuilder: (_, __, ___) => verificationScreen(),
                            reverseTransitionDuration: const Duration(milliseconds: 60),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      //15 300
                      'Already have account?',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 100),
                            pageBuilder: (_, __, ___) => loginScreen(),
                            reverseTransitionDuration: const Duration(milliseconds: 60),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                divider(),
                SizedBox(height: 8.h),
                googleCard(onPressed: ()async{
                  final userCred = await googleSignIn(context);
                  if (userCred != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Signed in as ${userCred.user?.displayName}")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sign in cancelled or failed")),
                    );
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (_, __, ___) => homeScreen(),
                        reverseTransitionDuration: const Duration(milliseconds: 60),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  }
                },),
                SizedBox(height: 8.h),
                SelectableText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'By Signing to this Account You are accepting our ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: secondaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
