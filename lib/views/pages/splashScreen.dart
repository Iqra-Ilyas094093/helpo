import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_design/repository/splashServices.dart';
import 'package:login_design/screens/pages/getStarted/getStarted.dart';
import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/register/registerScreen.dart';
import 'package:login_design/screens/pages/verification/routes/routes.dart';
import 'package:login_design/screens/pages/wrapper/wrapper.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  // splashServices splash = splashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // splash.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/haqdaar.jpeg'),
        nextScreen: loginScreen(),
        splashIconSize: 300,
      ),
    );
  }
}
