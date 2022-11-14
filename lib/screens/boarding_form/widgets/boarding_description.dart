import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class BoardingDescription extends StatelessWidget {
  const BoardingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // service icon
        SvgPicture.asset(
          'assets/icons/ic_boarding_icon.svg',
          height: 12.h
        ),
        // service description
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '¿Buscas a alguien que cuide de tu perro mientras estás de viaje? ¡Aquí lo encontrarás!. Elige a uno de nuestros cuidadores para que cuide a tu mascota en su casa cuando te vayas.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}