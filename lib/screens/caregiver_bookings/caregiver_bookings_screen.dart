import 'package:flutter/material.dart';
import 'package:fielamigo_app/screens/caregiver_bookings/widgets/booking_list_tile.dart';

class CaregiverBookingsScreen extends StatelessWidget {
  const CaregiverBookingsScreen({super.key});

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
                /* Two ElevatedButtons in row */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/caregiver/bookings/new");
                      },
                      child: const Text("Solicitudes Nuevas"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/caregiver/home");
                      },
                      child: const Text("Reservas Completadas"),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 0,
                  serviceType: "Entrenamiento",
                  dogName: "Atom",
                  stateIcon: "pets",
                  ownerName: "Ignacio Illanes",
                  startingDate: "14/09/2022",
                  endingDate: "14/10/2022",
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 1,
                  serviceType: "Entrenamiento",
                  dogName: "Fido",
                  stateIcon: "pets",
                  ownerName: "Ignacio Illanes",
                  startingDate: "15/10/2022",
                  endingDate: "15/12/2022",
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 2,
                  serviceType: "Paseo",
                  dogName: "Atom",
                  stateIcon: "cancel",
                  ownerName: "Ignacio Illanes",
                  startingDate: "15/10/2022",
                  endingDate: "15/12/2022",
                ),
                const SizedBox(height: 5),
                BookingListTile(
                  index: 3,
                  serviceType: "Paseo",
                  dogName: "Atom",
                  stateIcon: "cancel",
                  ownerName: "Ignacio Illanes",
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
