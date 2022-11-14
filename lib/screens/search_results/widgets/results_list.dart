import 'package:flutter/material.dart';

import '../../../widgets/caregiver_card.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CaregiverCard(
          userId: 1,
          name: 'Juan Perez',
          rating: 4.5,
          price: 100.75,
          isVerified: true,
          priceDetails: "Precio por noche",
          zone: "Miraflores",
          city: "La Paz",
          onCardPressed: () => print('card pressed'),
        ),
        const SizedBox(height: 10),
        CaregiverCard(
          userId: 2,
          name: 'Juan Perez',
          rating: 4.5,
          price: 100.75,
          isVerified: true,
          priceDetails: "Precio por noche",
          zone: "Miraflores",
          city: "La Paz",
          imageUrl: "https://storage.googleapis.com/petbacker/images/blog/2018/pet-care-dog-sitting-services.jpg",
          onCardPressed: () => print('card pressed'),
        ),
      ]

      // TODO: add when result list is empty
      // const SizedBox(height: 10),
      //   const Text(
      //     "No se encontraron resultados",
      //     style: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   const SizedBox(height: 10),
      //   const Text(
      //     "Intenta con otros datos",
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w400,
      //     ),
      //   ),
    );
  }
}