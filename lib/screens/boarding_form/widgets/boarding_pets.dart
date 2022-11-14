import 'package:flutter/material.dart';

import '../../../widgets/pet_list.dart';

class BoardingPets extends StatelessWidget {
  const BoardingPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "¿Quiénes se alojarán?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          PetList(),
        ],
      ),
    );
  }
}