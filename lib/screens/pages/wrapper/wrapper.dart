import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_design/screens/pages/getStarted/getStarted.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          final user = snapshot.data!;
          if(user.emailVerified){
            return homeScreen();
          }else{
            return verificationScreen(trimEmail: 'user',);
          }
        }
        return getStarted();
      },
    );
  }
}
