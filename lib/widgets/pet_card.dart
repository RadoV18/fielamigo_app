import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/boarding_cubit/boarding_cubit.dart';

class PetCard extends StatefulWidget {
  final int dogId;
  final String name;
  final String breed;
  final String size;
  final int age;
  final String imageUrl;
  final bool isSelectable;

  const PetCard({
    super.key,
    required this.dogId,
    required this.name,
    required this.breed,
    required this.size,
    required this.age,
    required this.imageUrl,
    this.isSelectable = false
    // this.onSelectable;
  });

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
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
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 4.0,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Color(0xff047b5b),
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  child: Image.network(
                    widget.imageUrl,
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
                    widget.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.breed} ${widget.size.toLowerCase()}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Icon(Icons.pets, size: 14),
                      const SizedBox(width: 10,),
                      Text(
                        '${widget.age.toString()} años',
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
          widget.isSelectable ?
          Checkbox(
            checkColor: Colors.white,
            activeColor: const Color(0xff3a5080),
            value: isSelected,
            onChanged: (value) {
              if(value != null) {
                if(value) {
                  context.read<BoardingCubit>().addDog(widget.dogId);
                  setState(() {
                    isSelected = true;
                  });
                } else {
                  context.read<BoardingCubit>().removeDog(widget.dogId);
                  setState(() {
                    isSelected = false;
                  });
                }
                
              }
            },
          ) : IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/owner/pets/info");
            },
            icon: const Icon(
              Icons.info,
              color: Color.fromARGB(255, 37, 37, 37),
              size: 30
            )
          )
        ]
      ),
    );
  }
}