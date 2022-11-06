import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerPetsScreen extends StatelessWidget {
  const OwnerPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Mis Mascotas',
      ),
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    SizedBox(height: 5),
                    PetCard(
                      name: "Toffee",
                      breed: "Chihuahua",
                      size: "Pequeño",
                      age: "6 años",
                      imageUrl: "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
                    ),
                    SizedBox(height: 5),
                    PetCard(
                      name: "Toffee",
                      breed: "Chihuahua",
                      size: "Pequeño",
                      age: "6 años",
                      imageUrl: "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
                    ),
                    SizedBox(height: 5),
                    PetCard(
                      name: "Toffee",
                      breed: "Chihuahua",
                      size: "Pequeño",
                      age: "6 años",
                      imageUrl: "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
                    ),
                  ],
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
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarOwner(isPetsSelected: true),
    );
  }
}