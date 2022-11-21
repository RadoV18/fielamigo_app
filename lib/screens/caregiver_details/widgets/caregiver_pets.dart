import 'package:flutter/material.dart';

import '../../../widgets/pet_list.dart';

class CaregiverPets extends StatelessWidget {
  final String firstName;

  const CaregiverPets({
    super.key,
    required this.firstName
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
        const PetList(
          isScrollable: false
        )
      ],
    );
  }
}