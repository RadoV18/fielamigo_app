import 'package:flutter/material.dart';
import '../../../widgets/one_pet.dart';

class BoardingPet extends StatelessWidget {
  const BoardingPet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "¿Quiénes?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          OnePet(),
        ],
      ),
    );
  }
}
