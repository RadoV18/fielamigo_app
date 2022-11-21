import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BiographyCard extends StatelessWidget {

  final int userId;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final double rating;
  final int reviewCount;
  final String zone;
  final String city;
  final String? imageUrl;
  final Function() onContactPressed;

  // TODO: change to DTO

  const BiographyCard({
    super.key,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
    required this.rating,
    required this.reviewCount,
    required this.zone,
    required this.city,
    this.imageUrl,
    required this.onContactPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff047b5b),
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // profile picture
          SizedBox(
            height: 100,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 4.0,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 2.0
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: imageUrl != null ?
                Image.network(
                  imageUrl!,
                  fit: BoxFit.cover
                )
                : const FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 70
                  )
                )
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name and verified badge
              Row(
                children: [
                  Text(
                    "$firstName $lastName",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  const SizedBox(width: 5),
                  if (isVerified)
                    const Icon(
                      Icons.verified,
                      color: Colors.white,
                      size: 20
                    )
                ]
              ),
              // rating and review count
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.white
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    }
                  ),
                  const SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '($reviewCount reseñas)',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  )
                ]
              ),
              // zone and city
              Row(
                children: [
                  const Icon(
                    color: Colors.white,
                    Icons.location_on,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "$zone, $city",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onContactPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4b67a6),
                  elevation: 10.0,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1.0
                  )
                ),
                child: Text("Contactar a $firstName"),
              )
            ],
          ),
        ],
      ),
    );
  }
}