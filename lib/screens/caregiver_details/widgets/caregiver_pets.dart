import 'package:flutter/material.dart';

import '../../../data/models/dog_res_dto.dart';
import '../../../widgets/pet_card.dart';
import '../../../widgets/pet_list.dart';

class CaregiverPets extends StatelessWidget {
  final String firstName;
  final List<DogResDto> dogs;

  const CaregiverPets({
    super.key,
    required this.firstName,
    this.dogs = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Mascotas de $firstName",
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return PetCard(
              dogId: dogs[index].dogId!,
              name: dogs[index].name!,
              breed: dogs[index].breed!,
              size: dogs[index].size!,
              age: 3,
              imageUrl: dogs[index].imageUrl,
              isSelectable: false,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: dogs.length
        )
      ],
    );
  }
}