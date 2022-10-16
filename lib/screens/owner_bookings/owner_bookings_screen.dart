import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerBookingsScreen extends StatelessWidget {
  const OwnerBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBarOwner(
        isBookingsSelected: true,
      ),
    );
  }
}