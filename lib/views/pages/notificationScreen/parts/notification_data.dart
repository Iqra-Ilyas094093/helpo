import 'package:flutter/material.dart';
import 'notification_model.dart';

class NotificationData {
  static List<NotificationItem> items = [
    NotificationItem(
      title: "Support a Child’s Education",
      message: "Help provide school supplies and tuition to children in need.",
      icon: Icons.school,
      color: Colors.indigo,
    ),
    NotificationItem(
      title: "Health Care for All",
      message: "Your support brings vital medicine and treatment to underserved communities.",
      icon: Icons.local_hospital,
      color: Colors.redAccent,
    ),
    NotificationItem(
      title: "Feed a Family Today",
      message: "Just \$5 can provide a meal to a hungry family.",
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
    NotificationItem(
      title: "Disaster Relief Needed",
      message: "Emergency aid is on the way, but we need your help to reach more lives.",
      icon: Icons.warning,
      color: Colors.deepOrange,
    ),
    NotificationItem(
      title: "Donation Received — Thank You!",
      message: "Your generosity is on its way to those who need it most.",
      icon: Icons.favorite,
      color: Colors.pinkAccent,
    ),
    NotificationItem(
      title: "Payment Successful",
      message: "We've processed your donation. Together, we’re building a better world.",
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    NotificationItem(
      title: "You're a Changemaker!",
      message: "Your donation just made an impact. Thank you for believing in the cause.",
      icon: Icons.emoji_events,
      color: Colors.amber,
    ),
    NotificationItem(
      title: "Real Impact Starts with You",
      message: "One person can’t change the world, but you can change someone’s world.",
      icon: Icons.public,
      color: Colors.lightBlue,
    ),
    NotificationItem(
      title: "Kindness is Contagious",
      message: "Your generosity inspires others. Let's build a chain of compassion.",
      icon: Icons.volunteer_activism,
      color: Colors.lightGreen,
    ),
  ];
}
