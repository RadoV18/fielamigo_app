import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';

class OnePet extends StatelessWidget {
  const OnePet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          // TODO: use a ListView.builder to display the pets
          SizedBox(height: 5),
          PetCard(
            dogId: 1,
              name: "Fido",
              breed: "Golden",
              size: "Pequeño",
              age: 1,
              imageUrl:
                  "https://www.elmueble.com/medio/2022/09/05/perro-cachorro_82dd9cd3_900x900.jpg"),
        ],
      ),
    );
  }
}
