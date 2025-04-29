import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/auth/emailAuthentication.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/validators.dart';
import 'package:login_design/view_models/auth_view_model.dart';
import 'package:login_design/views/pages/register/parts/registerField.dart';
import 'package:login_design/views/pages/register/parts/rich%20text.dart';
import 'package:provider/provider.dart';

import '../../../utilites/routes/routes_name.dart';
import '../../../utilites/utils.dart';
import '../homeScreen/homeScreen.dart';
import '../login/parts/divider.dart';
import '../login/parts/googleCard.dart';
import '../login/parts/passwordField.dart';
import '../login/parts/topheader.dart';
import '../verification/parts/registerButton.dart';

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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String? selectedValue;
  final List<String> items = ['Donor', 'Receiver',];

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
                SizedBox(height: 20.h),
                topHeader(text: 'Register'),
                SizedBox(height: 20.h),
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
                SizedBox(height: 16.h),
                registerField(
                  node1: emailNode,
                  node2: passwordNode,
                  validator: validateEmail,
                  controller: authViewModel.emailController,
                  hintText: 'Enter Email',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 16.h),
                passwordField(controller: passwordController, obscure: true, text: 'Enter Password',node2: confirmPasswordNode,node1: passwordNode,),
                SizedBox(height: 16.h),
                passwordField(controller: confirmPasswordController, obscure: true, text: 'Confirm Password',node1: confirmPasswordNode,node2: confirmPasswordNode,),
                SizedBox(height: 16.h),
                DropdownButtonFormField<String>(
                  isDense: true,
                  isExpanded: true,
                  value: selectedValue,
                  alignment: AlignmentDirectional.bottomStart,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.h),
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  ),
                  hint: Text("Select your role",style: Theme.of(context).textTheme.bodyLarge!.copyWith(),),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: Theme.of(context).textTheme.bodyLarge!.copyWith() ,),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.h),
                registerButton(
                  text: 'Register',
                  ontap: () async {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      if(authViewModel.emailController.text.isEmpty){
                        Utils.flushBarErrorMessage('Enter Email', context);
                      }else if(passwordController.text.isEmpty){
                        Utils.flushBarErrorMessage('Enter password', context);
                      }
                      else{
                        Map data = {
                          "name":usernameController.text,
                          "email":authViewModel.emailController,
                          "password":passwordController.text,
                          "role":selectedValue,
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
                        Navigator.pushNamed(context, RoutesName.login);
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
                SizedBox(height: 10.h),
                divider(),
                SizedBox(height: 15.h),
                googleCard(
                  onPressed: () async {
                    final userCred = await googleSignIn(context);
                    if (userCred != null) {
                      Navigator.pushReplacementNamed(context, RoutesName.home);
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
                richText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
