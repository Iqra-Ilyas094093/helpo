import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/screens/pages/forgotPassword/forgotPassword.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/login/parts/customizedTextField.dart';
import 'package:login_design/screens/pages/login/parts/divider.dart';
import 'package:login_design/screens/pages/login/parts/fieldLabel.dart';
import 'package:login_design/screens/pages/login/parts/googleCard.dart';
import 'package:login_design/screens/pages/login/parts/passwordField.dart';
import 'package:login_design/screens/pages/login/parts/phoneField.dart';
import 'package:login_design/screens/pages/login/parts/topheader.dart';
import 'package:login_design/screens/pages/register/registerScreen.dart';
import 'package:login_design/screens/pages/verification/parts/registerButton.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/screens/pages/wrapper/wrapper.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/customSnackbar.dart';
import 'package:login_design/utilites/validators.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  // final _thirdNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0).h,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  topHeader(text: 'Helpo'),
                  SizedBox(height: 25.h),
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
                  SizedBox(height: 18.h),
                  fieldLabel(text: 'Email'),
                  customizedTextField(
                    func: validateEmail,
                    icon: Icons.email_outlined,
                    controller: emailController,
                    onPressIcon: () {},
                  ),
                  SizedBox(height: 18.h),
                  fieldLabel(text: 'Password'),
                  passwordField(controller: PasswordController,obscure: true,text: '',node1: passwordNode,node2: passwordNode,),
                  SizedBox(height: 15.h),
                  divider(),
                  SizedBox(height: 15.h),
                  fieldLabel(text: 'Phone Number'),
                  phoneField(controller: phoneController),
                  SizedBox(height: 15.h),
                  registerButton(
                    text: 'Login',
                    ontap: () async {
                      if(formKey.currentState!.validate()){
                        final success = await login(
                          emailController.text,
                          PasswordController.text,
                          context,
                        );
                        if (success) {
                          Navigator.of(context).push(
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
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 100),
                              pageBuilder: (_, __, ___) => registerScreen(),
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
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 100),
                          pageBuilder: (_, __, ___) => forgotPassword(),
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
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
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
                        SizedBox(
                          height: 35,
                          child: showSnackbar(
                            context,
                            "Signed in as ${userCred.user?.displayName}",
                          ),
                        );
                      } else {
                        showSnackbar(context, "Sign in cancelled or failed");

                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
