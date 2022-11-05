import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:fielamigo_app/screens/owner_bookings/owner_bookings_screen.dart';
import 'package:fielamigo_app/screens/owner_pets/owner_pets_screen.dart';
import 'package:fielamigo_app/screens/owner_profile/owner_profile_screen.dart';
import 'package:fielamigo_app/widgets/navigation.dart';
import 'package:fielamigo_app/widgets/service_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';
import '../caregiver_test/c_test.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text(
              "Bienvenido, {dueño}",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "¿Qué necesita tu perro?",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Column(
                  children: const [
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Alojamiento",
                        route: "/owner/boarding",
                        icon: Icons.bug_report),
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Paseo",
                        route: "/owner/walking",
                        icon: Icons.bug_report),
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Entrenamiento",
                        route: "/owner/training",
                        icon: Icons.bug_report),
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Cuidado",
                        route: "/owner/nursing",
                        icon: Icons.bug_report),
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Seguros",
                        route: "/owner/insurance",
                        icon: Icons.bug_report),
                    SizedBox(height: 10),
                    ServiceButton(
                        text: "Veterinarias",
                        route: "/vets",
                        icon: Icons.bug_report),
                  ]),
            )
          ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarOwner(
        isHomeSelected: true,
      ),
    );
  }
}

// class OwnerHomeScreen extends StatelessWidget {
//   const OwnerHomeScreen({super.key});

//   static const List<Widget> screens = [
//     OwnerBookingsScreen(),
//     CareTest(
//       st: "Dos",
//     ),
//     Home(),
//     OwnerPetsScreen(),
//     OwnerProfileScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Navigation(
//       startingIndex: 2,
//       tabItems: [
//         TabItem(Icons.calendar_month_outlined, "Reservas", Colors.red),
//         TabItem(Icons.message, "Mensajes", Colors.orange),
//         TabItem(Icons.home, "Inicio", Colors.blue),
//         TabItem(Icons.pets, "Mascotas", Colors.cyan),
//         TabItem(Icons.person, "Perfil", Colors.green)
//       ],
//       screens: screens
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(children: [
//         SizedBox(height: 5.h),
//         Text(
//           "Bienvenido, {dueño}",
//           style: TextStyle(
//             fontSize: 20.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "¿Qué necesita tu perro?",
//           style: TextStyle(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Expanded(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 ServiceButton(
//                     text: "Alojamiento",
//                     route: "/owner/boarding",
//                     icon: Icons.bug_report),
//                 ServiceButton(
//                     text: "Paseo",
//                     route: "/owner/walking",
//                     icon: Icons.bug_report),
//                 ServiceButton(
//                     text: "Entrenamiento",
//                     route: "/owner/training",
//                     icon: Icons.bug_report),
//                 ServiceButton(
//                     text: "Cuidado",
//                     route: "/owner/nursing",
//                     icon: Icons.bug_report),
//                 ServiceButton(
//                     text: "Seguros",
//                     route: "/owner/insurance",
//                     icon: Icons.bug_report),
//                 ServiceButton(
//                     text: "Veterinarias",
//                     route: "/vets",
//                     icon: Icons.bug_report),
//               ]),
//         )
//       ]),
//     );
//   }
// }
