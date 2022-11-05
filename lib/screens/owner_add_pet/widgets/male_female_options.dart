import 'package:fielamigo_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MaleFemaleOptions extends StatelessWidget {
  const MaleFemaleOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomRadioButton(
            text: "Macho",
            icon: SvgPicture.asset(
              "assets/icons/ic_dog_male.svg",
              height: 40,
            )
          )
        ),
        SizedBox(width: 1.h),
        Expanded(
          flex: 1,
          child: CustomRadioButton(
            text: "Hembra",
            icon: SvgPicture.asset(
              "assets/icons/ic_dog_female.svg",
              color: Colors.pink,
              height: 40,
            )
          ),
        ),
      ],
    );
  }
}