import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/views/pages/home/home.dart';

void showDonationSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissal by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 16),
            Text('Thank You',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Your donation was successful.\nWe truly appreciate your support!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.home); // Close the dialog
              },
              child: Text('Back To Home',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,color: Colors.white,
                fontSize: 15,
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    },
  );
}
