
import 'package:login_design/utilites/validators.dart';
import '../login/parts/topheader.dart';
import '../register/parts/registerField.dart';
import '../verification/parts/registerButton.dart';
import '../verification/routes/routes.dart';

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
                  fontSize: 18,
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
                ontap: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
