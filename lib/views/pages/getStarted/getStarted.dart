import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/views/pages/getStarted/parts/utility.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utilites/colors.dart';
import '../login/loginScreen.dart';
import '../verification/parts/registerButton.dart';

class getStarted extends StatefulWidget {
  const getStarted({super.key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return slider(
                    images[index],
                    mainText[index],
                    secondText[index],
                    context,
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 9 / 16,
                  height: MediaQuery.of(context).size.height * 0.85,
                  autoPlay: true,
                  viewportFraction: 1,

                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: 3,
                        effect: SlideEffect(
                          activeDotColor: primaryColor,
                          dotColor: Colors.grey.shade400,
                        ),
                      ),
                      SizedBox(height: 10),
                      registerButton(text: 'Get Started', ontap:() {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginScreen()));
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider(
    String image,
    String mainText,
    String secondText,
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(height: 380, child: LottieBuilder.asset(image)),

        Text(
          mainText,
          //20 700
          style:Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700,fontSize: 20)
        ),
        Text(
          secondText,
          style: TextStyle(
            fontSize: 15,
            color: secondaryColor,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
