import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRadioButton extends StatelessWidget {

  final String text;
  final SvgPicture? icon;
  final bool isSelected;

  const CustomRadioButton({
    super.key,
    required this.text,
    this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          const SizedBox(width: 25),
          Text(text)
        ],
      ),
    );
  }
}
