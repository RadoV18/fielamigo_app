import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bienvenido a FielAmigo!",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          "Antes de comenzar, necesitamos conocer algunos datos tuyos:",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal
          )
        )
      ]
    );
  }
}