import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:fielamigo_app/widgets/navigation.dart';
import 'package:fielamigo_app/widgets/service_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';
import '../caregiver_test/c_test.dart';

// class OwnerHomeScreen extends StatelessWidget {
//   const OwnerHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: false,
//       body: Center(
//         child: Column(children: [
//           SizedBox(height: 5.h),
//           Text(
//             "Bienvenido, {dueño}",
//             style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             "¿Qué necesita tu perro?",
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Expanded(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const [
//                   ServiceButton(
//                       text: "Alojamiento",
//                       route: "/owner/boarding",
//                       icon: Icons.bug_report),
//                   ServiceButton(
//                       text: "Paseo",
//                       route: "/owner/walking",
//                       icon: Icons.bug_report),
//                   ServiceButton(
//                       text: "Entrenamiento",
//                       route: "/owner/training",
//                       icon: Icons.bug_report),
//                   ServiceButton(
//                       text: "Cuidado",
//                       route: "/owner/nursing",
//                       icon: Icons.bug_report),
//                   ServiceButton(
//                       text: "Seguros",
//                       route: "/owner/insurance",
//                       icon: Icons.bug_report),
//                   ServiceButton(
//                       text: "Veterinarias",
//                       route: "/vets",
//                       icon: Icons.bug_report),
//                 ]),
//           )
//         ]),
//       ),
//       bottomNavigationBar: const BottomNavigationBarOwner(
//         isHomeSelected: true,
//       ),
//     );
//   }
// }

class OwnerHomeScreen extends StatelessWidget {
  OwnerHomeScreen({super.key});

  List<TabItem> tabItems = List.of([
    TabItem(Icons.calendar_month_outlined, "Reservas", Colors.red),
    TabItem(Icons.message, "Mensajes", Colors.orange),
    TabItem(Icons.home, "Inicio", Colors.blue),
    TabItem(Icons.timeline_rounded, "Mascotas", Colors.cyan),
    TabItem(Icons.person, "Perfil", Colors.green),
  ]);

  List<Widget> screens = [
    const CareTest(
      st: 'Uno',
    ),
    const CareTest(
      st: "Dos",
    ),
    const Home(),
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          SizedBox(height: 5.h),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ServiceButton(
                      text: "Alojamiento",
                      route: "/owner/boarding",
                      icon: Icons.bug_report),
                  ServiceButton(
                      text: "Paseo",
                      route: "/owner/walking",
                      icon: Icons.bug_report),
                  ServiceButton(
                      text: "Entrenamiento",
                      route: "/owner/training",
                      icon: Icons.bug_report),
                  ServiceButton(
                      text: "Cuidado",
                      route: "/owner/nursing",
                      icon: Icons.bug_report),
                  ServiceButton(
                      text: "Seguros",
                      route: "/owner/insurance",
                      icon: Icons.bug_report),
                  ServiceButton(
                      text: "Veterinarias",
                      route: "/vets",
                      icon: Icons.bug_report),
                ]),
          )
        ]),
      ),
    );
  }
}
