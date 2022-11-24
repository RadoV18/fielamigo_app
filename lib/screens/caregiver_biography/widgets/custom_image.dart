import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomImage extends StatelessWidget {
  final String url;
  const CustomImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 80.w, height: 30.h, child: Image.network(url));
  }
}
