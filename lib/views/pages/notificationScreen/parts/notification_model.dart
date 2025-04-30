import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String message;
  final IconData icon;
  final Color color;

  NotificationItem({
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
  });
}
