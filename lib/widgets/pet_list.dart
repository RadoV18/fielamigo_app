import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dog_cubit/dog_cubit.dart';
import '../bloc/page_status.dart';

class PetList extends StatelessWidget {
  final bool isScrollable;
  final bool isSelectable;

  const PetList({
    super.key,
    this.isScrollable = false,
    this.isSelectable = false
  });

  static final List pets = [
    {
      "dogId": 1,
      "name": "Toffee",
      "breed": "Chihuahua",
      "size": "Pequeño",
      "age": 6,
      "imageUrl":
          "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
    },
    {
      "dogId": 2,
      "name": "Firulais",
      "breed": "Golden Retriever",
      "size": "Grande",
      "age": 2,
      "imageUrl":
          "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
    },
    {
      "dogId": 3,
      "name": "Toffee",
      "breed": "Chihuahua",
      "size": "Pequeño",
      "age": 6,
      "imageUrl":
          "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
    },
    {
      "dogId": 4,
      "name": "Firulais",
      "breed": "Golden Retriever",
      "size": "Grande",
      "age": 2,
      "imageUrl":
          "https://e7.pngegg.com/pngimages/872/773/png-clipart-toms-dog-asdfmovie5-theme-the-living-tombstone-dog-of-wisdom-remix-feat-joe-gran-blue-version-tongue-carnivoran-toy-dog-thumbnail.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogCubit, DogState>(
      buildWhen: (previous, current) => previous.dogs != current.dogs,
      builder: (context, state) {
        if(state.dogs.isEmpty) {
          return const SizedBox.shrink();
        } else if(state.status == PageStatus.fetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: isScrollable ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final age = DateTime.now().year - state.dogs[index].birthDate!.year;
              return PetCard(
                dogId: state.dogs[index].dogId!,
                name: state.dogs[index].name!,
                breed: state.dogs[index].breed!,
                size: state.dogs[index].size!,
                birthDate: state.dogs[index].birthDate!,
                age: age,
                imageUrl: state.dogs[index].imageUrl,
                isSelectable: isSelectable,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: state.dogs.length
          );
        }
      },
    );
  }
}
