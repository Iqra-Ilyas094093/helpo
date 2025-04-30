import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/views/pages/home/mainMenu.dart';
import 'package:login_design/views/pages/home/parts/helper.dart';
import 'package:login_design/views/pages/login/parts/fieldLabel.dart';

class home extends StatelessWidget {
  int index = 0;

  home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 110.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          vertical: 28,
                          horizontal: 15,
                        ).w.h,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: primaryColor,
                          backgroundImage: AssetImage('assets/images/prof.jpg',),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fieldLabel(text: 'Hello,'),
                            fieldLabel(text: 'Talawish Sikandar'),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade100,
                          ),
                          child: Icon(Icons.more_vert,color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10).w.h,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Compaigns',
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: primaryColor, width: 2.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.orange, width: 1.w),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(width: 20.w, color: primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2).w.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 19.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return categoryModel(name: names[index],color: colors[index],icon: icon[index],);
                  }),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8).w.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 19.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return popular(image: images[index],text:description[index],descriptionText: descr[index],);
                    }),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6).w.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Top Donors',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 19.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).w,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return topDonors(image: profilePic[index],name: topDonorName[index],bio: donorsBio[index],);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class categoryModel extends StatelessWidget {
  String icon;
  String name;
  Color color;
  categoryModel({super.key,required this.name,required this.color,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.orange.shade200.withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 50.h,
              width: 35.w,
              child: Image.asset(icon,)),
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class popular extends StatelessWidget {
  String image;
  String text;
  String descriptionText;
  popular({super.key,required this.image,required this.text,required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0,).w,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => mainMenu(image: image, title: text, descriptionText: descriptionText),
          reverseTransitionDuration: const Duration(
          milliseconds: 60,
          ),
          transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
          opacity: animation,
          child: child,
          );
          },
          ));
        },
        child: Card(
          elevation: 2,
          child: Container(
            height: 200.h,
            width: 230.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14.r),
                      topRight: Radius.circular(14.r),
                    ),
                    color: primaryColor,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(14),topLeft: Radius.circular(14)),
                      child: Image.asset(image,fit: BoxFit.fitWidth,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 5).w.h,
                  child: Text(
                    text,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(fontSize: 14.sp,color: Colors.black),
                  ),
                ),

                Slider(
                  value: 0.5,
                  onChanged: (onChanged) {},
                  thumbColor: primaryColor,
                  activeColor: primaryColor,
                  inactiveColor: Colors.grey,
                ),
                Text(
                  "\$4,345 fund raised from \$9,000",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 10.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class topDonors extends StatelessWidget {
  String bio;
  String name;
  String image;
  topDonors({super.key,required this.image,required this.name,required this.bio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).h.w,
      child: Card(
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 60.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                CircleAvatar(radius: 20.r,backgroundColor: Colors.grey,backgroundImage: AssetImage(image),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12).h.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),),
                      Text(bio
                        ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.grey.shade700
                      ),maxLines: 1,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

