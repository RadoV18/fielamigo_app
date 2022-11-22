import 'package:flutter/material.dart';
import 'package:fielamigo_app/screens/caregiver_new_bookings/widgets/booking_list_tile.dart';

class CaregiverNewBookingsScreen extends StatelessWidget {
  const CaregiverNewBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("Solicitudes de reserva"),
        ),
        Expanded(
          child: Material(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.height * 0.89,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    BookingListTile(
                      index: 0,
                      serviceType: "Paseo",
                      dogName: "Fido",
                      stateIcon: "pets",
                      ownerName: "Ricardo Vaquera",
                      startingDate: "14/09/2022",
                      endingDate: "14/10/2022",
                    ),
                    const SizedBox(height: 5),
                    BookingListTile(
                      index: 1,
                      serviceType: "Entrenamiento",
                      dogName: "Atom",
                      stateIcon: "pets",
                      ownerName: "Ignacio Illanes",
                      startingDate: "15/10/2022",
                      endingDate: "15/12/2022",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
