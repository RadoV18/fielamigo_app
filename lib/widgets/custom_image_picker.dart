import 'dart:io';

import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CustomImagePicker extends StatelessWidget {
  final String imagePath;
  final Function(File?) onImageSelected;
  final bool enabled;

  const CustomImagePicker({
    super.key,
    required this.onImageSelected,
    required this.imagePath,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff047b5b),
              width: 3)
            ,
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: ClipRRect(
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
                child: imagePath == "" ? 
                  Icon(
                    Icons.camera_alt,
                    size: 10.h,
                    color: Colors.grey[400],
                  ) :
                  Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                  ),
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
                padding: const EdgeInsets.all(10)),
            onPressed: enabled ? () {
              ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((im) {
                if (im != null) {
                  print("I picked an image");
                  File image = File(im.path);
                  onImageSelected(image);
                } else {
                  print("I didn't pick an image");
                  onImageSelected(null);
                }
              });
            } : null,
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
