import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/register/parts/registerField.dart';
import 'package:login_design/screens/pages/verification/routes/routes.dart';
import 'package:login_design/utilites/validators.dart';

import '../../../auth/emailAuthentication.dart';

class forgotPassword extends StatelessWidget {
  FocusNode emailFocus = FocusNode();

  forgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 240.h),
              topHeader(text: 'Forgot Password'),
              SizedBox(height: 30.h),
              Text(
                'Enter your email to reset Password',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              registerField(
                hintText: 'Enter your Email',
                icon: Icons.email_outlined,
                controller: emailController,
                validator: validateEmail,
                node1: emailFocus,
                node2: emailFocus,
              ),
              SizedBox(height: 30.h),
              registerButton(
                text: 'Reset Password',
                ontap: () async {
                  await resetPassword(
                    emailController.text.toString(),
                    context,
                  ).then((onValue) {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
