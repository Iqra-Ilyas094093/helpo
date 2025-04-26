import 'package:flutter/material.dart';
import 'package:login_design/screens/pages/getStarted/getStarted.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/register/registerScreen.dart';
import 'package:login_design/screens/pages/splashScreen.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/utilites/routes/routes_name.dart';

import '../../screens/pages/login/loginScreen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){

    case RoutesName.verification:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => verificationScreen(),
          reverseTransitionDuration: const Duration(
            milliseconds: 60,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    case RoutesName.splash:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => splashScreen(),
          reverseTransitionDuration: const Duration(
            milliseconds: 60,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    case RoutesName.register:
        return PageRouteBuilder(
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
    );

    case RoutesName.home:
        return PageRouteBuilder(
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
    );

    case RoutesName.login:
        return PageRouteBuilder(
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
    );
    case RoutesName.getStarted:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => getStarted(),
          reverseTransitionDuration: const Duration(
            milliseconds: 60,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

    default:
        return MaterialPageRoute(builder: (_){
    return const Scaffold(
    body: Center(
    child: Text('No route defined'),
    ),
    );
    });

    }
  }
}