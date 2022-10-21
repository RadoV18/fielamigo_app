import 'package:flutter/material.dart';

class BookingListTile extends StatelessWidget {
  int index;
  String serviceType;
  String dogName;
  String ownerName;
  String startingDate;
  String endingDate;

  BookingListTile(
    {
      super.key,
      required this.index,
      required this.serviceType,
      required this.dogName,
      required this.ownerName,
      required this.startingDate,
      required this.endingDate
    }
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.pets),
      title: Text("$serviceType - $dogName"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ownerName),
          Text("$startingDate - $endingDate"),
        ],
      ),
    );
  }
}
