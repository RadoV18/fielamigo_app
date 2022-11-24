import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dog_cubit/dog_cubit.dart';
import '../../../widgets/pet_list.dart';

class BoardingPets extends StatelessWidget {
  const BoardingPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "¿Quiénes se alojarán?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocProvider<DogCubit>(
          create: (context) => DogCubit()..init(),
          child: const PetList(
            isSelectable: true
          ),
        ),
      ],
    );
  }
}