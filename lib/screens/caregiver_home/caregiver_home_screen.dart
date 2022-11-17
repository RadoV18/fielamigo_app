import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:fielamigo_app/screens/caregiver_bookings/caregiver_bookings_screen.dart';
import 'package:fielamigo_app/screens/caregiver_test/c_test.dart';
import 'package:fielamigo_app/widgets/navigation.dart';
import 'package:flutter/material.dart';

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
    const CaregiverBookingsScreen(),
    const CareTest(
      st: "Dos",
    ),
    const CareTest(
      st: "Tres",
    ),
    const CareTest(
      st: "Cuatro",
    ),
    const CareTest(
      st: "Cinco",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigation(startingIndex: 2, tabItems: tabItems, screens: screens);
  }
}
