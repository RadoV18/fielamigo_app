import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class DogImagePicker extends StatelessWidget {
  const DogImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.h),
            topRight: Radius.circular(30.h),
            bottomRight: Radius.circular(30.h),
            bottomLeft: Radius.circular(30.h),

          ),
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.camera_alt,
                size: 10.h,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10)
            ),
            onPressed: () {
              ImagePicker().pickImage(source: ImageSource.gallery)
              .then((im) => print("I picked an image"));
            },
            child: const Icon(
              Icons.image_search_rounded,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}