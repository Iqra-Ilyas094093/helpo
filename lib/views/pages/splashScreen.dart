import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_design/views/pages/getStarted/getStarted.dart';
import 'package:login_design/views/pages/home/home.dart';
import 'package:login_design/views/pages/homeScreen/homeScreen.dart';
import 'package:login_design/views/pages/menuScreen/menuScreen.dart';
import 'package:login_design/views/pages/notificationScreen/notificationScreen.dart';
import 'package:login_design/views/pages/profileScreen/profileScreen.dart';
import 'package:lottie/lottie.dart';

import 'login/loginScreen.dart';

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
        nextScreen: getStarted(),
        splashIconSize: 300,
      ),
    );
  }
}
