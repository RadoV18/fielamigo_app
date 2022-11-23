import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/user_info_cubit/user_info_cubit.dart';

class ProfileCard extends StatefulWidget {
  final String? profilePictureUrl;

  const ProfileCard({
    super.key,
    this.profilePictureUrl,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) { 
        String? firstName = state.firstName;
        String? lastName = state.lastName;
        String? fullName = firstName != null && lastName != null ? "$firstName $lastName" : null;
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
                child: widget.profilePictureUrl != null ?
                  // If the user has a profile picture, show it
                  Image.network(
                    widget.profilePictureUrl!,
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
              fullName ?? 'Usuario de FielAmigo',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }
    );
  }
}
