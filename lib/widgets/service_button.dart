import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ServiceButton extends StatelessWidget {
  final String text;
  final String route;
  final SvgPicture icon;

  const ServiceButton({
    super.key,
    required this.text,
    required this.route,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: OutlinedButton.styleFrom(
        fixedSize: Size(90.w, 10.h)
      ),
      child: Row(
        children: [
          icon,
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black87
              )
            ),
          ),
        ],
      )
    );
  }
}