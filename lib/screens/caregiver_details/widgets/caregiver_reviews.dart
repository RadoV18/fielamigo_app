import 'package:flutter/material.dart';

import '../../../widgets/review_card.dart';

class CaregiverReviews extends StatelessWidget {
  final String firstName;

  const CaregiverReviews({
    super.key,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: const [
                  ReviewCard(
                    firstName: "Juan",
                    lastName: "Perez",
                    rating: 4.5,
                    review: "Muy buen servicio, recomendado. Lorem ipsum dolor sit amet asdf jakshd alkjhd fhjlk dsf hjkadsfhjkl adsfghjkl asfdhjkl "
                  ),
                  SizedBox(height: 20,),
                  ReviewCard(
                    firstName: "Juan",
                    lastName: "Perez",
                    rating: 4.5,
                    review: "Muy buen servicio, recomendado. Lorem ipsum dolor sit amet asdf jakshd alkjhd fhjlk dsf hjkadsfhjkl adsfghjkl asfdhjkl "
                  ),
                  SizedBox(height: 20,),
                  ReviewCard(
                    firstName: "Juan",
                    lastName: "Perez",
                    rating: 4.5,
                    review: "Muy buen servicio, recomendado. Lorem ipsum dolor sit amet asdf jakshd alkjhd fhjlk dsf hjkadsfhjkl adsfghjkl asfdhjkl "
                  ),
                  SizedBox(height: 20,),
                  ReviewCard(
                    firstName: "Juan",
                    lastName: "Perez",
                    rating: 4.5,
                    review: "Muy buen servicio, recomendado. Lorem ipsum dolor sit amet asdf jakshd alkjhd fhjlk dsf hjkadsfhjkl adsfghjkl asfdhjkl "
                  ),
                  SizedBox(height: 20,),
                  ReviewCard(
                    firstName: "Juan",
                    lastName: "Perez",
                    rating: 4.5,
                    review: "Muy buen servicio, recomendado. Lorem ipsum dolor sit amet asdf jakshd alkjhd fhjlk dsf hjkadsfhjkl adsfghjkl asfdhjkl "
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3a5080),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Anterior")
                )
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3a5080),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Siguiente")
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}