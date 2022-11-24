import 'package:flutter/material.dart';
import '../../../data/models/dog_res_dto.dart';
import '../../../widgets/pet_card.dart';

class BoardingPet extends StatelessWidget {
  final List<DogResDto> dogs;

  const BoardingPet({
    super.key,
    required this.dogs,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "¿Quiénes?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final age = DateTime.now().year - dogs[index].birthDate!.year;
              return PetCard(
                dogId: dogs[index].dogId!,
                name: dogs[index].name!,
                breed: dogs[index].breed!,
                size: dogs[index].size!,
                age: age,
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
      ),
    );
  }
}
