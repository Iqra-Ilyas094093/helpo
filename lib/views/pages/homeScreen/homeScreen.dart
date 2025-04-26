import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../login/parts/topheader.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10.w),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.horizontal_split),iconSize: 30.sp,),
                topHeader(text: 'Haqdaar'),
                CircleAvatar(
                  radius: 15.r,
                  child: Icon(Icons.person_2_outlined),
                  backgroundColor: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
      body: Text('data')
    );
  }
}
