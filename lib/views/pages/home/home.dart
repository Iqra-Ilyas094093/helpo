import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
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
      backgroundColor: Colors.white38,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 15,
                      ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: primaryColor,
                        backgroundImage: AssetImage('assets/images/prof.jpg',),
                      ),
                      SizedBox(width: 10),
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
                        height: 30,
                        width: 30,
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
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search Compaigns',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.orange, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 20, color: primaryColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
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
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesName.popularCompaigns);
                    },
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
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
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Top Donors',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
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
      height: 90,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.orange.shade200.withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 50,
              width: 35,
              child: Image.asset(icon,)),
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
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
      padding: const EdgeInsets.symmetric(horizontal: 3.0,),
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
          elevation: 5,
          child: Container(
            height: 200,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: primaryColor,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(14),topLeft: Radius.circular(14)),
                      child: Image.asset(image,fit: BoxFit.cover,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 5),
                  child: Text(
                    text,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(fontSize: 13,color: Colors.black),
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
                    fontSize: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                CircleAvatar(radius: 20,backgroundColor: Colors.grey,backgroundImage: AssetImage(image),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),),
                      Text(bio
                        ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
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

