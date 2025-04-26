import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/login/parts/divider.dart';
import 'package:login_design/screens/pages/login/parts/googleCard.dart';
import 'package:login_design/screens/pages/login/parts/passwordField.dart';
import 'package:login_design/screens/pages/register/parts/registerField.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/parts/topHeader.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/validators.dart';
import 'package:login_design/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utilites/utils.dart';
import '../homeScreen/homeScreen.dart';

class registerScreen extends StatefulWidget {
  registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final formKey = GlobalKey<FormState>();
  final userNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final confirmPasswordNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                topHeader(text: 'Register'),
                SizedBox(height: 25.h),
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
                SizedBox(height: 18.h),
                registerField(
                  node1: userNode,
                  node2: emailNode,
                  validator: validateUsername,
                  controller: usernameController,
                  hintText: 'Enter Name',
                  icon: Icons.person_2_outlined,
                ),
                SizedBox(height: 18.h),
                registerField(
                  node1: emailNode,
                  node2: passwordNode,
                  validator: validateEmail,
                  controller: emailController,
                  hintText: 'Enter Email',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 18.h),
                passwordField(controller: passwordController, obscure: true, text: 'Enter Password',node2: confirmPasswordNode,node1: passwordNode,),
                SizedBox(height: 18.h),
                passwordField(controller: confirmPasswordController, obscure: true, text: 'Confirm Password',node1: confirmPasswordNode,node2: confirmPasswordNode,),
                SizedBox(height: 18.h),
                registerButton(
                  text: 'Register',
                  ontap: () async {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      if(emailController.text.isEmpty){
                        Utils.flushBarErrorMessage('Enter Email', context);
                      }else if(passwordController.text.isEmpty){
                        Utils.flushBarErrorMessage('Enter password', context);
                      }
                      else{
                        Map data = {
                          "name":usernameController.text,
                          "email":emailController.text,
                          "password":passwordController.text,
                        };
                        authViewModel.registerApi(data, context);
                      }
                    }
                     else {
                      Utils.flushBarErrorMessage('Passwords Not Matched', context);
                    }
                  },
                ),
                SizedBox(height: 10.h),
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
                            reverseTransitionDuration: const Duration(
                              milliseconds: 60,
                            ),
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
                SizedBox(height: 15.h),
                divider(),
                SizedBox(height: 15.h),
                googleCard(
                  onPressed: () async {
                    final userCred = await googleSignIn(context);
                    if (userCred != null) {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 100),
                          pageBuilder: (_, __, ___) => homeScreen(),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 60,
                          ),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Signed in as ${userCred.user?.displayName}",
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Sign in cancelled or failed"),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 10.h),
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
