import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onPressed;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon and option name
          Row(
            children: [
              Icon(
                icon,
                color: Colors.grey.shade800,
                size: 8.h,
              ),
              const SizedBox(width: 26),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ),
          // button
          Icon(
            Icons.arrow_forward_rounded,
            color: Colors.black,
            size: 5.h,
          )
        ]
      ),
    );
  }
}