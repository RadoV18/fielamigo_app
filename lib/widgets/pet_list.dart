import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            // TODO: use a ListView.builder to display the pets
            SizedBox(height: 5),
            PetCard(
                name: "Toffee",
                breed: "Chihuahua",
                size: "Pequeño",
                age: "6 años",
                imageUrl:
                    "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"),
            SizedBox(height: 5),
            PetCard(
                name: "Toffee",
                breed: "Chihuahua",
                size: "Pequeño",
                age: "6 años",
                imageUrl:
                    "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"),
            SizedBox(height: 5),
            PetCard(
                name: "Toffee",
                breed: "Chihuahua",
                size: "Pequeño",
                age: "6 años",
                imageUrl:
                    "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"),
          ],
        ),
      ),
    );
  }
}
