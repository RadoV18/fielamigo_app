import 'package:flutter/material.dart';
import 'package:fielamigo_app/screens/owner_bookings/widgets/booking_list_tile.dart';

class OwnerBookingsScreen extends StatelessWidget {
  const OwnerBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("Tus Reservas"),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                BookingListTile(
                  index: 0,
                  serviceType: "Entrenamiento",
                  dogName: "Fido",
                  stateIcon: "pets",
                  caregiverName: "Alex Quiroga",
                  startingDate: "14/09/2022",
                  endingDate: "14/10/2022",
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 1,
                  serviceType: "Entrenamiento",
                  dogName: "Atom",
                  stateIcon: "pets",
                  caregiverName: "Alex Quiroga",
                  startingDate: "15/10/2022",
                  endingDate: "15/12/2022",
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 2,
                  serviceType: "Entrenamiento",
                  dogName: "Atom",
                  stateIcon: "cancel",
                  caregiverName: "Alex Quiroga",
                  startingDate: "15/10/2022",
                  endingDate: "15/12/2022",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
