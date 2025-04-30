import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/views/pages/home/parts/alertbox.dart';
import 'package:login_design/views/pages/home/parts/helper.dart';
import 'package:login_design/views/pages/home/parts/paymentMethodTile.dart';
import 'package:login_design/views/pages/verification/parts/registerButton.dart';

class paymentMethod extends StatefulWidget {
  const paymentMethod({super.key});

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  int selectedMethod = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12).h.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('\$ 100.0',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),),
            Container(
              height: 40.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: GestureDetector(
                onTap: (){
                  showDonationSuccessDialog(context);
                },
                child: Center(
                  child: Text('Donate',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Center(
              child: Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Choose your payment Method',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: methods.length,
                itemBuilder: (context, index) {
                  final method = methods[index];
                  return PaymentMethodTile(
                    methodName: method['name'] as String,
                    icon: method['icon'] as IconData,
                    isSelected: selectedMethod == index,
                    onTap: () {
                      setState(() {
                        selectedMethod = index;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
