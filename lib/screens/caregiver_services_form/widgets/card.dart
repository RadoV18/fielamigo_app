import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CardFb1 extends StatelessWidget {
  final String text;
  final String iconPath;
  final String subtitle;
  final bool isAlreadyCompleted;
  final Function() onPressed;

  const CardFb1(
      {required this.text,
      required this.iconPath,
      required this.subtitle,
      required this.onPressed,
      required this.isAlreadyCompleted,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 85.w,
        height: 15.h,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 10.w,
              height: 10.w,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 55.w,
              child: Column(
                children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  const SizedBox(height: 10,),
                  Text(
                    subtitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/icons/ic_green_check_checked.svg',
                    color: isAlreadyCompleted ? const Color(0xff10B981) : Colors.transparent,
                  ),
                ) 
              ],
            )
          ],
        ),
      ),
    );
  }
}
