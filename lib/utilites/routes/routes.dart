import 'package:flutter/material.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/views/pages/home/donateAmount.dart';
import 'package:login_design/views/pages/home/home.dart';
import 'package:login_design/views/pages/home/paymentMethods.dart';
import 'package:login_design/views/pages/popularCompaigns/popularCompaigns.dart';
import '../../views/pages/forgotPassword/forgotPassword.dart';
import '../../views/pages/getStarted/getStarted.dart';
import '../../views/pages/homeScreen/homeScreen.dart';
import '../../views/pages/login/loginScreen.dart';
import '../../views/pages/register/registerScreen.dart';
import '../../views/pages/splashScreen.dart';
import '../../views/pages/verification/verificationScreen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case RoutesName.popularCompaigns:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => Popularcompaigns(),
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
      case RoutesName.paymentMethod:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => paymentMethod(),
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
      case RoutesName.donateAmount:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => donateAmount(),
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
      case RoutesName.mainhome:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => home(),
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
      case RoutesName.forgotPassword:
        return PageRouteBuilder(
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
        );

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