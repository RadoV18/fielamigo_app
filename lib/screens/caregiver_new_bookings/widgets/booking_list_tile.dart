import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookingListTile extends StatelessWidget {
  int index;
  String serviceType;
  String dogName;
  String stateIcon;
  String ownerName;
  String startingDate;
  String endingDate;

  BookingListTile({
    super.key,
    required this.index,
    required this.serviceType,
    required this.dogName,
    required this.stateIcon,
    required this.ownerName,
    required this.startingDate,
    required this.endingDate,
  });

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
            color: Color.fromARGB(35, 132, 131, 131),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          const Card(
            clipBehavior: Clip.antiAlias,
            elevation: 4.0,
            shape: CircleBorder(
              side: BorderSide(
                color: Color(0xff047b5b),
                width: 2.0,
              ),
            ),
            child: ClipRRect(
                child: Icon(
              Icons.pets,
              size: 35,
            )),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$serviceType - $dogName",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: [
                Text(
                  ownerName,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
              ]),
              Row(
                children: [
                  Text(
                    "$startingDate - $endingDate",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/caregiver/bookings/request");
            },
            icon: const Icon(Icons.help, size: 30))
      ]),
    );
  }
}
