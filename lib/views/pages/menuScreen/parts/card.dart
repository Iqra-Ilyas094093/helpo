import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.w,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Color(0xFFF2994A), Color(0xFFF2C94C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background_waves.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: pi/2,
                          child: Image.asset(
                            'assets/icons/goldenSim.png',
                            width: 60.w,
                            height: 50.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          // VISA
                          'VISA',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                    // **** **** **** 3456
                      '**** **** **** 3456',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card Holder
                            Text('Card Holder',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white70, fontSize: 12)),
                            // JOHN DOE
                            Text('JOHN DOE',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Expires
                            Text('Expires',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white70, fontSize: 12)),
                            // '08/25'
                            Text('08/25',
                                style: Theme.of(context).textTheme
                                .titleLarge!.copyWith(
                                  fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
