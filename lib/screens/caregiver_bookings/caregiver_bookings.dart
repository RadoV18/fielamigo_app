import 'package:fielamigo_app/screens/caregiver_bookings/widgets/booking_list_tile.dart';
import 'package:flutter/material.dart';

class OwnerBookings extends StatelessWidget {
  const OwnerBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("Tus Reservas"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("solicitudes Nuevas"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Reservas Completadas"),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              child: BookingListTile(index: index, serviceType: "Paseo", dogName: "Atom", ownerName: "Ignacio Illanes", startingDate: "13/09/2022", endingDate: "27/09/2022"),
            ),
          ),
        ),
      ],
    );
  }
}