import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import '../bloc/bottom_navbar_cubit/bottom_navbar_state.dart';

class Navigation extends StatelessWidget {
  final int startingIndex;
  final List<TabItem> tabItems;
  final List<Widget> screens;

  Navigation({
    super.key,
    this.startingIndex = 0,
    required this.tabItems,
    required this.screens});

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
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) => CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            selectedCallback: ((selectedPos) =>
                BlocProvider.of<BottomNavBarCubit>(context)
                    .setIndex(selectedPos!)),
          ),
        ),
      )
    );
  }
}
