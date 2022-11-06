import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileCard extends StatelessWidget {
  final String? profilePictureUrl;

  const ProfileCard({
    super.key,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile picture
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff047b5b),
              width: 2
            )
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: profilePictureUrl != null ?
              // If the user has a profile picture, show it
              Image.network(
                profilePictureUrl!,
                width: 8.h,
                height: 8.h,
                fit: BoxFit.cover,
              ) :
              // Default profile picture
              Icon(
                Icons.person,
                size: 8.h,
                color: Colors.grey[400],
              ),
          )
        ),
        const SizedBox(width: 20),
        Text(
          'Nombre de usuario',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
