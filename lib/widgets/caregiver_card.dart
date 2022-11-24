import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screens/caregiver_details/caregiver_details_screen.dart';

class CaregiverCard extends StatelessWidget {
  final int boardingServiceId;
  final int userId;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final int reviewCount;
  final double rating;
  final double price;
  final double pickupRate;
  final String zone;
  final String city;
  final String priceDetails;
  final String? imageUrl;


  const CaregiverCard({
    super.key,
    required this.boardingServiceId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.isVerified = false,
    this.reviewCount = 0,
    this.rating = 0,
    required this.price,
    required this.pickupRate,
    required this.priceDetails,
    required this.zone,
    required this.city,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CaregiverDetailsScreen(
          boardingServiceId: boardingServiceId,
          userId: userId,
          firstName: firstName,
          lastName: lastName,
          isVerified: isVerified,
          reviewCount: reviewCount,
          rating: rating,
          price: price,
          pickupRate: pickupRate,
          priceDetails: priceDetails,
          zone: zone,
          city: city,
          imageUrl: imageUrl
        ))
      ),
      child: Container(
        width: double.infinity,
        height: 85,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(7, 7),
              spreadRadius: -2,
              blurRadius: 7,
              color: Color.fromRGBO(0, 0, 0, 0.2)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // profile picture
            SizedBox(
              width: 60,
              height: 70,
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
            // name and details
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name and verified badge
                  Row(
                    children: [
                      Text(
                        "$firstName $lastName",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      const SizedBox(width: 5),
                      if (isVerified)
                        const Icon(
                          Icons.verified,
                          color: Colors.green,
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
                          color: Colors.amber
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        }
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rating.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '($reviewCount reseñas)',
                        style: const TextStyle(
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
                        Icons.location_on,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "$zone, $city",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 5),
            // price
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bs.$price",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    priceDetails,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}