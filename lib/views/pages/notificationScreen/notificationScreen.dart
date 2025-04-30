import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'package:login_design/views/pages/notificationScreen/parts/notification_card.dart';
import 'package:login_design/views/pages/notificationScreen/parts/notification_data.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({super.key});

  @override
  State<notificationScreen> createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {


  void _deleteNotification(int index) {
    final deletedItem = NotificationData.items[index];
    setState(() {
      NotificationData.items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none
        ),
        backgroundColor: primaryColor,
        content: Text('Notification deleted',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          color: Colors.white,
        ),),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Undo?',
          onPressed: () {
            // Undo the deletion by adding the item back to the list
            setState(() {
              NotificationData.items.insert(index, deletedItem);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 12.h,),
          Center(
            child: Text(
              'Notifications',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(color: Colors.grey.shade500,),
          ),
          SizedBox(height: 12.h,),
          Expanded(
            child: ListView.builder(
              itemCount: NotificationData.items.length,
              itemBuilder: (context, index) {
                return NotificationCard(
                  item: NotificationData.items[index],
                  onDelete: () => _deleteNotification(index), // Pass the delete callback
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
