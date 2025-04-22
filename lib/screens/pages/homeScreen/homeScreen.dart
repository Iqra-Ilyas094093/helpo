import 'package:flutter/material.dart';
import 'package:login_design/screens/pages/verification/routes/routes.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Center(
        child: Icon(Icons.home,color: primaryColor,size: 63,),
      ),
    );
  }
}
