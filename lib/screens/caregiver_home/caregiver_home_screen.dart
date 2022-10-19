import 'dart:developer';

import 'package:fielamigo_app/screens/caregiver_test/c_test.dart';
import 'package:flutter/material.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import '../../bloc/bottom_navbar_cubit/bottom_navbar_state.dart';

class CaregiverHomeScreen extends StatelessWidget {
  CaregiverHomeScreen({super.key});
  List<TabItem> tabItems = List.of([
    TabItem(Icons.calendar_month_outlined, "Reservas", Colors.red),
    TabItem(Icons.message, "Mensajes", Colors.orange),
    TabItem(Icons.home, "Inicio", Colors.blue),
    TabItem(Icons.timeline_rounded, "Servicios", Colors.cyan),
    TabItem(Icons.person, "Perfil", Colors.green),
  ]);

  List screens = [
    const CareTest(st: 'Uno',),
    const CareTest(st: "Dos",),
    const CareTest(st: "Tres",),
    const CareTest(st: "Cuatro",),
    const CareTest(st: "Cinco",),
  ];

  final CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return screens[state.currentIndex];
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) => CircularBottomNavigation(
              tabItems,
              controller: _navigationController,
              selectedCallback: ((selectedPos) => BlocProvider.of<BottomNavBarCubit>(context).setIndex(selectedPos!)),
            ),
          ),
        )
    );
  }
}
