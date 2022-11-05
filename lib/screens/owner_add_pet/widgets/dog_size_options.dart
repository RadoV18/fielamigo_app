import 'package:fielamigo_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DogSizeOptions extends StatelessWidget {
  const DogSizeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomRadioButton(
                text: "Pequeño",
                icon: SvgPicture.asset(
                  "assets/icons/ic_dog_size_sm.svg",
                  height: 50,
                )
              ),
            ),
            SizedBox(width: 1.h),
            Expanded(
              flex: 1,
              child: CustomRadioButton(
                text: "Mediano",
                icon: SvgPicture.asset(
                  "assets/icons/ic_dog_size_md.svg",
                  height: 50,
                )
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomRadioButton(
          text: "Grande",
          icon: SvgPicture.asset(
            "assets/icons/ic_dog_size_xl.svg",
            height: 50,
          )
        ),
      ]
    );
  }
}