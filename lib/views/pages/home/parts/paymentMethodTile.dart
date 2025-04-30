import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_design/utilites/colors.dart';

class PaymentMethodTile extends StatelessWidget {
  final String methodName;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    Key? key,
    required this.methodName,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0).h.w,
        child: Card(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(icon, size: 28),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      methodName,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  CustomCircularCheckbox(isChecked: isSelected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCircularCheckbox extends StatelessWidget {
  final bool isChecked;

  const CustomCircularCheckbox({Key? key, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isChecked?null:Border.all(color: Colors.grey, width: 2),
        color: isChecked ? primaryColor : Colors.transparent,
      ),
      child: isChecked
          ? Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
