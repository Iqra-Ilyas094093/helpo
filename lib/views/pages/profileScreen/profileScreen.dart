import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/views/pages/login/parts/fieldLabel.dart';

import '../home/home.dart';
import '../home/parts/helper.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        SizedBox(height: 70.h,),
        Center(
          child: CircleAvatar(
            radius: 70,
            backgroundColor: primaryColor,
            child: Icon(Icons.person_2_outlined),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: fieldLabel(text: 'Talawish Sikandar'),
        ),
        Text(
          'workflow094093@gmail.com',
          //15 500
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
            color: Colors.grey.shade400
          ),
        ),
        SizedBox(height: 15.h,),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0).w,
            child: Column(
              children: List.generate(4, (index) {
                return profileTiles(name: ProfileList[index],icon: icons[index],);
              }),
            ),
          ),
        )
      ],
    ));
  }
}

class profileTiles extends StatelessWidget {
  IconData icon;
  String name;
  profileTiles({super.key,required this.name,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0).h.w,
      child: Card(
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 60.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,).h.w,
            child: Row(
              children: [
                Icon(icon,color: Colors.black,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12).h.w,
                  child: Text(name,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.black,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
