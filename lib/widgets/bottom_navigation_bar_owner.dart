import 'package:flutter/material.dart';

import 'bottom_nav_shadow_painter.dart';
import 'nav_bar_icon.dart';

class BottomNavigationBarOwner extends StatelessWidget {
  final bool isHomeSelected;
  final bool isBookingsSelected;
  final bool isMessagesSelected;
  final bool isPetsSelected;
  final bool isProfileSelected;
  
  const BottomNavigationBarOwner({
    Key? key,
    this.isHomeSelected = false,
    this.isBookingsSelected = false,
    this.isMessagesSelected = false,
    this.isPetsSelected = false,
    this.isProfileSelected = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 62;

    return BottomAppBar(
      color: Colors.transparent,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BottomNavShadowPainter(),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavBarIcon(
                  text: "Reservas",
                  icon: Icons.calendar_month,
                  selected: isBookingsSelected,
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/bookings");
                  },
                  // defaultColor: secondaryColor,
                  // selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Mensajes",
                  icon: Icons.chat,
                  selected: isMessagesSelected,
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/messages");
                  },
                  // defaultColor: secondaryColor,
                  // selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Inicio",
                  icon: Icons.home_rounded,
                  selected: isHomeSelected,
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/home");
                  },
                ),
                NavBarIcon(
                  text: "Mascotas",
                  icon: Icons.pets_rounded,
                  selected: isPetsSelected,
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/pets");
                  },
                  // defaultColor: secondaryColor,
                  // selectedColor: primaryColor
                ),
                NavBarIcon(
                  text: "Perfil",
                  icon: Icons.person,
                  selected: isProfileSelected,
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/profile");
                  },
                  // selectedColor: primaryColor,
                  // defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
