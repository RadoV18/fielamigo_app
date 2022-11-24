import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:fielamigo_app/bloc/user_info_cubit/user_info_cubit.dart';
import 'package:fielamigo_app/screens/profile/widgets/profile_card.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../bloc/profile_picture_cubit/profile_picture_cubit.dart';
import 'widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  final String? profilePictureUrl;

  const ProfileScreen({
    super.key,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
      buildWhen: (previous, current) => previous.imageUrl != current.imageUrl,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(showLeading: false, title: 'Mi Perfil'),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // User profile picture and name
                ProfileCard(
                  profilePictureUrl: state.imageUrl,
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
                  onPressed: () => Navigator.pushNamed(
                      context, '/profile/personal-information'),
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
                  onPressed: () =>
                      Navigator.pushNamed(context, '/profile/address'),
                ),
                const Divider(
                  color: Color(0xFFBDBDBD),
                  height: 20,
                  thickness: 1,
                ),
                // Payment methods option
                BlocBuilder<UserInfoCubit, UserInfoState>(
                    builder: (context, state) {
                  if (state.isOwner) {
                    return ProfileOption(
                      icon: Icons.credit_card,
                      text: 'Métodos de Pago',
                      onPressed: () => Navigator.pushNamed(
                          context, '/profile/payment-methods'),
                    );
                  } else {
                    return Column(
                      children: [
                        ProfileOption(
                          icon: Icons.perm_device_information,
                          text: 'Biografía',
                          onPressed: () {
                            context.read<BioFeaturesCubit>().clear();
                            Navigator.pushNamed(context, '/caregiver/biography');
                            context.read<BioFeaturesCubit>().init();
                          },
                        ), 
                        const Divider(
                          color: Color(0xFFBDBDBD),
                          height: 20,
                          thickness: 1,
                        ),
                        ProfileOption(icon: Icons.settings, text:"Editar servicios", onPressed: () => Navigator.pushNamed(context, '/caregiver/services-form'))
                      ],  
                    );
                  }
                }),
                const Divider(
                  color: Color(0xFFBDBDBD),
                  height: 20,
                  thickness: 1,
                ),
                // Log out option
                ProfileOption(
                    icon: Icons.logout,
                    text: 'Cerrar Sesión',
                    onPressed: () {
                      FlutterSecureStorage storage =
                          const FlutterSecureStorage();
                      storage.delete(key: "token");
                      storage.delete(key: "refresh");
                      context.read<UserInfoCubit>().clear();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/welcome', (Route<dynamic> route) => false);
                    }),
              ],
            ),
          ))
        ],
      ),
    );

    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   extendBody: true,
    //   appBar:  CustomAppBar(
    //     onBackButtonPressed: () => Navigator.pop(context),
    //     title: 'Mi Perfil'
    //   ),
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20),
    //         child: Column (
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //               // User profile picture and name
    //               const ProfileCard(
    //                 // profilePictureUrl: profilePictureUrl, from token
    //               ),
    //               const Divider(
    //                 color: Color(0xFFBDBDBD),
    //                 height: 20,
    //                 thickness: 1,
    //               ),
    //               // Personal information option
    //               ProfileOption(
    //                 icon: Icons.person,
    //                 text: 'Datos Personales',
    //                 onPressed: () => Navigator.pushNamed(context, '/profile/personal-information'),
    //               ),
    //               const Divider(
    //                 color: Color(0xFFBDBDBD),
    //                 height: 20,
    //                 thickness: 1,
    //               ),
    //               // Address option
    //               ProfileOption(
    //                 icon: Icons.location_pin,
    //                 text: 'Dirección',
    //                 onPressed: () => Navigator.pushNamed(context, '/profile/address'),
    //               ),
    //               const Divider(
    //                 color: Color(0xFFBDBDBD),
    //                 height: 20,
    //                 thickness: 1,
    //               ),
    //               // Payment methods option
    //               ProfileOption(
    //                 icon: Icons.credit_card,
    //                 text: 'Métodos de Pago',
    //                 onPressed: () => Navigator.pushNamed(context, '/profile/payment-methods'),
    //               ),
    //               const Divider(
    //                 color: Color(0xFFBDBDBD),
    //                 height: 20,
    //                 thickness: 1,
    //               ),
    //               // Change account option or become a caregiver option
    //               ProfileOption(
    //                 icon: Icons.account_circle,
    //                 text: 'Cambiar de Cuenta',
    //                 onPressed: () => Navigator.pushNamed(context, '/profile/change-account'),
    //               ),
    //               const Divider(
    //                 color: Color(0xFFBDBDBD),
    //                 height: 20,
    //                 thickness: 1,
    //               ),
    //               // Log out option
    //               ProfileOption(
    //                 icon: Icons.logout,
    //                 text: 'Cerrar Sesión',
    //                 // TODO: handle log out
    //                 onPressed: () => Navigator.pushNamed(context, '/login'),
    //               ),
    //           ],
    //         ),
    //       )
    //     )
    //   ),
    //   bottomNavigationBar: const BottomNavigationBarOwner(
    //     isProfileSelected: true,
    //   ),
    // );
    // ignore: dead_code
    const Divider(
      color: Color(0xFFBDBDBD),
      height: 20,
      thickness: 1,
    );
    // Personal information option
    ProfileOption(
      icon: Icons.person,
      text: 'Datos Personales',
      onPressed: () =>
          Navigator.pushNamed(context, '/profile/personal-information'),
    );
    const Divider(
      color: Color(0xFFBDBDBD),
      height: 20,
      thickness: 1,
    );
    // Address option
    ProfileOption(
      icon: Icons.location_pin,
      text: 'Dirección',
      onPressed: () => Navigator.pushNamed(context, '/profile/address'),
    );
    const Divider(
      color: Color(0xFFBDBDBD),
      height: 20,
      thickness: 1,
    );
    // Payment methods option
    ProfileOption(
      icon: Icons.credit_card,
      text: 'Métodos de Pago',
      onPressed: () => Navigator.pushNamed(context, '/profile/payment-methods'),
    );
    const Divider(
      color: Color(0xFFBDBDBD),
      height: 20,
      thickness: 1,
    );
    // Log out option
    ProfileOption(
        icon: Icons.logout,
        text: 'Cerrar Sesión',
        onPressed: () {
          FlutterSecureStorage storage = const FlutterSecureStorage();
          storage.delete(key: "token");
          storage.delete(key: "refresh");
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome', (Route<dynamic> route) => false);
        });
  }
}
