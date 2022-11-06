import 'package:fielamigo_app/screens/profile/widgets/profile_card.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';
import 'widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  final String? profilePictureUrl;

  const ProfileScreen({
    super.key,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar:  CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Mi Perfil'
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  // User profile picture and name
                  const ProfileCard(
                    // profilePictureUrl: profilePictureUrl, from token
                  ),
                  const Divider(
                    color: Color(0xFFBDBDBD),
                    height: 20,
                    thickness: 1,
                  ),
                  // Personal information option
                  ProfileOption(
                    icon: Icons.person,
                    text: 'Datos Personales',
                    onPressed: () => Navigator.pushNamed(context, '/profile/personal-information'),
                  ),
                  const Divider(
                    color: Color(0xFFBDBDBD),
                    height: 20,
                    thickness: 1,
                  ),
                  // Address option
                  ProfileOption(
                    icon: Icons.location_pin,
                    text: 'Dirección',
                    onPressed: () => Navigator.pushNamed(context, '/profile/address'),
                  ),
                  const Divider(
                    color: Color(0xFFBDBDBD),
                    height: 20,
                    thickness: 1,
                  ),
                  // Payment methods option
                  ProfileOption(
                    icon: Icons.credit_card,
                    text: 'Métodos de Pago',
                    onPressed: () => Navigator.pushNamed(context, '/profile/payment-methods'),
                  ),
                  const Divider(
                    color: Color(0xFFBDBDBD),
                    height: 20,
                    thickness: 1,
                  ),
                  // Change account option or become a caregiver option
                  ProfileOption(
                    icon: Icons.account_circle,
                    text: 'Cambiar de Cuenta',
                    onPressed: () => Navigator.pushNamed(context, '/profile/change-account'),
                  ),
                  const Divider(
                    color: Color(0xFFBDBDBD),
                    height: 20,
                    thickness: 1,
                  ),
                  // Log out option
                  ProfileOption(
                    icon: Icons.logout,
                    text: 'Cerrar Sesión',
                    // TODO: handle log out
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
              ],
            ),
          )
        )
      ),
      bottomNavigationBar: const BottomNavigationBarOwner(
        isProfileSelected: true,
      ),
    );
  }
}