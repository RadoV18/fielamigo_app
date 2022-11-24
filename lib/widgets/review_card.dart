import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  final String? imageUrl;
  final String firstName;
  final String lastName;
  final String review;
  final double rating;

  const ReviewCard({
    super.key,
    this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: const [
          BoxShadow(
            offset: Offset(7, 7),
            spreadRadius: -2,
            blurRadius: 7,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 4.0,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Color(0xff047b5b),
                      width: 2.0,
                    ),
                  ),
                  child: ClipRRect(
                    child: imageUrl != null ?
                      Image.network(
                        imageUrl!,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover
                      ) :
                      const Icon(Icons.pets, size: 50, color: Colors.grey),
                  )
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemSize: 18,
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
                    ],
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.6),
                    child: Text(
                      review,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ]
      ),
    );
  }
}