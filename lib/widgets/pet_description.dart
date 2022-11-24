import 'package:fielamigo_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class PetDescription extends StatelessWidget {
  final bool isMale;
  final String size;

  const PetDescription({
    super.key,
    required this.isMale,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: CustomRadioButton(
              text: isMale ? "Macho" : "Hembra",
              icon: SvgPicture.asset(
                isMale ? "assets/icons/ic_dog_male.svg" : "assets/icons/ic_dog_female.svg",
                height: 40,
              ),
              onPressed: () {},
            )),
        SizedBox(width: 1.h),
        Expanded(
          flex: 1,
          child: CustomRadioButton(
            text: size == "Pequeño" ? "Pequeño" : size == "Mediano" ? "Mediano" : "Grande",
            icon: SvgPicture.asset(
              size == "Pequeño"
                  ? "assets/icons/ic_dog_size_sm.svg"
                  : size == "Mediano"
                      ? "assets/icons/ic_dog_size_md.svg"
                      : "assets/icons/ic_dog_size_xl.svg",
              height: 40,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 1.h),
      ],
    );
  }
}
