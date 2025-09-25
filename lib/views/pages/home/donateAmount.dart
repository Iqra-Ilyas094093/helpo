import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/views/pages/home/parts/helper.dart';
import 'package:login_design/views/pages/home/paymentMethods.dart';
import 'package:login_design/views/pages/verification/parts/registerButton.dart';

class donateAmount extends StatelessWidget {
  const donateAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 30).h.w,
        child: registerButton(text: 'Continue to Payment', ontap: (){
         Navigator.pushNamed(context, RoutesName.paymentMethod);
        }),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Center(
              child: Text(
                'Donate Amount',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'Enter donation amount',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0).h.w,
              child: Text(
                'How much would you like to top up?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey.shade600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12).h.w,
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Center(child: Text('\$ 100.0',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index){
                return Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(child: Text(amount[index],style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black
                  ),),),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
