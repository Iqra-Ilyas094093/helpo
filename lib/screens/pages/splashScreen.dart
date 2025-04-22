import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_design/screens/pages/getStarted/getStarted.dart';
import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/register/registerScreen.dart';
import 'package:login_design/screens/pages/verification/routes/routes.dart';
import 'package:login_design/screens/pages/wrapper/wrapper.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatelessWidget {

  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: backgroundColor,
        splash: LottieBuilder.asset('assets/animations/load.json'),
        nextScreen: wrapper(),
        splashIconSize: 224,
      ),
    );
  }
}
