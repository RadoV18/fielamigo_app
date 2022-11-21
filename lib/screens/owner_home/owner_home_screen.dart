import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:fielamigo_app/screens/owner_bookings/owner_bookings_screen.dart';
import 'package:fielamigo_app/screens/owner_pets/owner_pets_screen.dart';
import 'package:fielamigo_app/screens/profile/profile_screen.dart';
import 'package:fielamigo_app/widgets/navigation.dart';
import 'package:fielamigo_app/widgets/service_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/user_info_cubit/user_info_cubit.dart';
import '../caregiver_test/c_test.dart';

class OwnerHomeScreen extends StatelessWidget {

  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      OwnerBookingsScreen(),
      CareTest(
        st: "Dos",
      ),
      HomeScreen(),
      OwnerPetsScreen(),
      ProfileScreen()
    ];

    return Navigation(
      startingIndex: 2,
      tabItems: [
        TabItem(Icons.calendar_month_outlined, "Reservas", Colors.red),
        TabItem(Icons.message, "Mensajes", Colors.orange),
        TabItem(Icons.home, "Inicio", Colors.blue),
        TabItem(Icons.pets, "Mascotas", Colors.cyan),
        TabItem(Icons.person, "Perfil", Colors.green)
      ],
      screens: screens
    );
  }
}


class HomeScreen extends StatelessWidget {
  final String? firstName;

  const HomeScreen({super.key, this.firstName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        print("${state.userId} ${state.firstName} ${state.lastName}");
        return SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  state.firstName != null ? "Hola, ${state.firstName}" : "Bienvenido a FielAmigo",
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
                    children: [
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Alojamiento",
                        route: "/owner/boarding",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_boarding.svg",
                          height: 8.h,
                        )
                      ),
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Paseo",
                        route: "/owner/walking",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_dog_walk.svg",
                          height: 8.h,
                        )
                      ),
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Entrenamiento",
                        route: "/owner/training",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_training.svg",
                          height: 8.h,
                        )
                      ),
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Cuidado",
                        route: "/owner/nursing",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_nursing.svg",
                          height: 8.h,
                        )
                      ),
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Seguros",
                        route: "/owner/insurance",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_insurance.svg",
                          height: 8.h,
                        )
                      ),
                      const SizedBox(height: 10),
                      ServiceButton(
                        text: "Veterinarias",
                        route: "/vets",
                        icon: SvgPicture.asset(
                          "assets/icons/ic_vet.svg",
                          height: 8.h,
                        )
                      ),
                    ]
                  ),
                )
              ]
            ),
          ),
        );
      }
    );
  }
}


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
