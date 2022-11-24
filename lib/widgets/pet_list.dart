import 'package:fielamigo_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';

class PetList extends StatelessWidget {
  final bool isScrollable;
  final bool isSelectable;

  const PetList({
    super.key,
    this.isScrollable = true,
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
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PetCard(
          dogId: pets[index]["dogId"],
          name: pets[index]["name"],
          breed: pets[index]["breed"],
          size: pets[index]["size"],
          age: pets[index]["age"],
          imageUrl: pets[index]["imageUrl"],
          isSelectable: isSelectable,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: pets.length
    );
  }
}
