import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';
import 'notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback onDelete; // Callback function to handle delete

  const NotificationCard({
    super.key,
    required this.item,
    required this.onDelete, // Pass the onDelete callback
  });

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          titlePadding: const EdgeInsets.only(top: 20).h,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10,
          ).h.w,
          title: Column(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: item.color.withOpacity(0.2),
                child: Icon(item.icon, size: 30, color: item.color),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
              ),
            ],
          ),
          content: Text(
            item.message,
            textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15.sp,
                color: Colors.grey.shade500,
              ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: item.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child:Text("Back",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.white,
              ),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).h.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        onTap: () => _showNotificationDialog(context),
        leading: CircleAvatar(
          backgroundColor: item.color.withOpacity(0.2),
          child: Icon(item.icon, color: item.color),
        ),
        title: Text(
          item.title,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(item.message,maxLines: 2,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 12.sp,color: Colors.grey.shade500
        ),),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert), // Dropdown icon (3 dots)
          onPressed: () {
            _showDeleteDialog(context);
          },
        ),
      ),
    );
  }

  // Show a dialog to confirm deletion
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Delete Notification?",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Are you sure you want to delete this notification? This action cannot be undone.",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontSize: 15.sp,color: Colors.grey.shade500),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the dialog
              child: Text("Cancel",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: primaryColor,
              ),),
            ),
            TextButton(
              onPressed: () {
                onDelete(); // Call the onDelete callback
                Navigator.pop(context); // Close the dialog
              },
              child:Text("Delete",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: primaryColor,
              ),),
            ),
          ],
        );
      },
    );
  }
}
