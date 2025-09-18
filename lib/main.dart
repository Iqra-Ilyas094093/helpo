import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/screens/pages/splashScreen.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/utilites/colors.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: ThemeData.dark().copyWith(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black12,
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
          home: splashScreen(),
        );
      },
    );
  }
}
