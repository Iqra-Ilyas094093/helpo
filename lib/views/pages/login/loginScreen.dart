import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/utilites/validators.dart';
import 'package:login_design/view_models/auth_view_model.dart';
import 'package:login_design/views/pages/login/parts/customizedTextField.dart';
import 'package:login_design/views/pages/login/parts/divider.dart';
import 'package:login_design/views/pages/login/parts/fieldLabel.dart';
import 'package:login_design/views/pages/login/parts/googleCard.dart';
import 'package:login_design/views/pages/login/parts/passwordField.dart';
import 'package:login_design/views/pages/login/parts/phoneField.dart';
import 'package:provider/provider.dart';

import '../../../utilites/utils.dart';
import '../verification/parts/registerButton.dart';
import '../verification/parts/topHeader.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
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
                  topHeader(text: 'Haqdaar'),
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
                    controller: authViewModel.emailController,
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
                      if(PasswordController.text.isEmpty){
                        Utils.flushBarErrorMessage('Enter Password', context);
                      }else{
                        Map data = {"email":authViewModel.emailController.text,"password":PasswordController.text};
                        authViewModel.loginApi(data,context);
                        print('api hit');
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
                          Navigator.pushNamed(context, RoutesName.register);
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
                      Navigator.pushNamed(context, RoutesName.forgotPassword);
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
                        Navigator.pushReplacementNamed(context, RoutesName.home);
                        Utils.flushBarErrorMessage("Signed in as ${userCred.user?.displayName}", context);
                      } else {
                        Utils.flushBarErrorMessage("Sign in cancelled or failed", context);
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
