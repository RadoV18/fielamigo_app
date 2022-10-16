import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBarOwner(
        isProfileSelected: true,
      ),
    );
  }
}