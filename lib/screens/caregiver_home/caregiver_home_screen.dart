import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:fielamigo_app/screens/caregiver_bookings/caregiver_bookings_screen.dart';
import 'package:fielamigo_app/widgets/navigation.dart';
import 'package:flutter/material.dart';

import '../caregiver_completed_bookings/caregiver_completed_bookings_screen.dart';
import '../caregiver_new_bookings/caregiver_new_bookings_screen.dart';
import '../profile/profile_screen.dart';

// ignore: must_be_immutable
class CaregiverHomeScreen extends StatelessWidget {
  CaregiverHomeScreen({super.key});
  List<TabItem> tabItems = List.of([
    TabItem(Icons.calendar_month_outlined, "Reservas", Colors.red),
    TabItem(Icons.message, "Mensajes", Colors.orange),
    TabItem(Icons.home, "Inicio", Colors.blue),
    TabItem(Icons.timeline_rounded, "Servicios", Colors.cyan),
    TabItem(Icons.person, "Perfil", Colors.green),
  ]);

  List<Widget> screens = [
    const CaregiverNewBookingsScreen(),
    const CaregiverNewBookingsScreen(),
    const CaregiverBookingsScreen(),
    const CaregiverCompletedBookingsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigation(startingIndex: 2, tabItems: tabItems, screens: screens);
  }
}
