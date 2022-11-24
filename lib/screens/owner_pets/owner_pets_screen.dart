import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:fielamigo_app/widgets/pet_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/dog_cubit/dog_cubit.dart';
import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerPetsScreen extends StatelessWidget {
  const OwnerPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogCubit>(
      create: (context) => DogCubit()..init(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(
            showLeading: false,
            title: 'Mis Mascotas',
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 65.h,
                  child: const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: PetList(
                        isScrollable: false,
                        isSelectable: false,
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    backgroundColor: const Color(0xFFE5E5E5),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/owner/pets/new");
                  },
                  child: const Text(
                    "Agregar Mascota",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );



    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      
      bottomNavigationBar: const BottomNavigationBarOwner(isPetsSelected: true),
    );
  }
}