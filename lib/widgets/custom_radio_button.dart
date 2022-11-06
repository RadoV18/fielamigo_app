import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRadioButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final SvgPicture? icon;
  final bool isSelected;

  const CustomRadioButton({
    super.key,
    required this.text,
    this.icon,
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        side: BorderSide(
          color: isSelected ? const Color(0xff01bf8f) : Colors.grey,
          width: isSelected ? 3 : 0.5,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          const SizedBox(width: 25),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}
