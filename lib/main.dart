import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/views/pages/getStarted/getStarted.dart';
import 'package:login_design/views/pages/home/home.dart';
import 'package:login_design/views/pages/homeScreen/homeScreen.dart';
import 'package:login_design/views/pages/popularCompaigns/popularCompaigns.dart';
import 'package:login_design/views/pages/splashScreen.dart';


void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        final app = MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark().copyWith(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade700,
            textTheme: TextTheme(
              titleLarge: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
              headlineSmall: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.white),
            ),
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.light,
            textTheme: TextTheme(
              titleLarge: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: mainTextColor),
              headlineSmall: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.black),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          ),
          title: 'Login Ui',
          home: getStarted(),
          // initialRoute: RoutesName.splash,
          // onGenerateRoute: Routes.generateRoute,
        );
        return kIsWeb?Center(child: SizedBox(width: 390,child: app,),):app;
      },
    );
  }
}
