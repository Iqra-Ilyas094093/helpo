import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../utilites/colors.dart';

class otpPinPut extends StatelessWidget {
  TextEditingController otpController;
  otpPinPut({super.key,required this.otpController});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Pinput(
      length: 4,
      controller: otpController,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.number,
      autofocus: true,
      onChanged: (value) {
        print('OTP so far: $value');
      },

      onCompleted: (value) {
        print('Entered OTP: $value');
        // Call your OTP verify function here
      },
    );
  }
}
