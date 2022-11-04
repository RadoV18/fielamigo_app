import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String breed;
  final String size;
  final String age;
  final String imageUrl;

  const PetCard({
    super.key,
    required this.name,
    required this.breed,
    required this.size,
    required this.age,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 85,
      padding: const EdgeInsets.all(15.0),
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    imageUrl,
                    height: 70,
                    fit: BoxFit.cover
                    )
                  ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$breed ${size.toLowerCase()}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Icon(Icons.pets, size: 14),
                      const SizedBox(width: 10,),
                      Text(
                        age,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ]
                  )
                ],
              ),
            ]
          ),
          IconButton(
            onPressed: () {
              print('edit pet');
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.grey,
              size: 30
            )
          )
        ]
      ),
    );
  }
}