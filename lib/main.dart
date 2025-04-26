import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/view_models/auth_view_model.dart';
import 'package:login_design/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>UserViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            darkTheme: ThemeData.dark().copyWith(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black12,
              textTheme: GoogleFonts.poppinsTextTheme().copyWith(
                bodyLarge: GoogleFonts.poppins(color: Colors.white),
                titleLarge: GoogleFonts.poppins(color: Colors.white),
                headlineSmall: GoogleFonts.poppins(color: Colors.white),
              ),
              inputDecorationTheme: InputDecorationTheme()
            ),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              brightness: Brightness.light,
              textTheme: GoogleFonts.poppinsTextTheme().copyWith(
                titleLarge: GoogleFonts.poppins(color: mainTextColor),
                headlineSmall: GoogleFonts.poppins(color: Colors.black),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            ),
            title: 'Login Ui',
            // home: loginScreen(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
