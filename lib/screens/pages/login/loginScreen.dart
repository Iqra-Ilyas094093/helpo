import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/login/parts/customizedTextField.dart';
import 'package:login_design/screens/pages/login/parts/divider.dart';
import 'package:login_design/screens/pages/login/parts/fieldLabel.dart';
import 'package:login_design/screens/pages/login/parts/googleCard.dart';
import 'package:login_design/screens/pages/login/parts/phoneField.dart';
import 'package:login_design/screens/pages/login/parts/topheader.dart';
import 'package:login_design/screens/pages/register/registerScreen.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/screens/pages/wrapper/wrapper.dart';
import 'package:login_design/utilites/colors.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0).h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 38.h),
                topHeader(text: 'AppName'),
                SizedBox(height: 35.h),
                Text(
                  "Welcome Back",
                  //18 700
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Explore Something new",
                  style: TextStyle(fontSize: 16.sp, color: secondaryColor),
                ),
                SizedBox(height: 20.h),
                fieldLabel(text: 'Email'),
                customizedTextField(icon: Icons.email_outlined,controller: emailController,),
                SizedBox(height: 18.h),
                fieldLabel(text: 'Password'),
                customizedTextField(icon: Icons.remove_red_eye_outlined,controller: PasswordController,),
                SizedBox(height: 30.h),
                divider(),
                SizedBox(height: 10.h),
                fieldLabel(text: 'Phone Number'),
                phoneField(controller: phoneController,),
                SizedBox(height: 14.h),
                registerButton(
                  text: 'Login',
                  ontap: () async {
                    final success = await login(emailController.text, PasswordController.text, context);
                    if(success){
                      Navigator.of(context).push(
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
                  },
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      //15 300
                      "Don't have account?",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 100),
                            pageBuilder: (_, __, ___) => registerScreen(),
                            reverseTransitionDuration: const Duration(milliseconds: 60),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                          ),
                        );

                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: (){},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                googleCard(onPressed:()async{
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
