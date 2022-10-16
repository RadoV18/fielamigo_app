import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerPetsScreen extends StatelessWidget {
  const OwnerPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBarOwner(
        isPetsSelected: true,
      ),
    );
  }
}