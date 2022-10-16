import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBarOwner(
        isHomeSelected: true,
      ),
    );
  }
}