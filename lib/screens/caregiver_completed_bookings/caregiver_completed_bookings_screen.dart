import 'package:flutter/material.dart';
import 'package:fielamigo_app/screens/caregiver_completed_bookings/widgets/booking_list_tile.dart';

class CaregiverCompletedBookingsScreen extends StatelessWidget {
  const CaregiverCompletedBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("Solicitudes de reserva"),
        ),
        Material(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.99,
              height: MediaQuery.of(context).size.height * 0.89,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  BookingListTile(
                    index: 0,
                    serviceType: "Entrenamiento",
                    dogName: "Fido",
                    stateIcon: "pets",
                    ownerName: "Ricardo Vaquera",
                    startingDate: "14/08/2022",
                    endingDate: "14/09/2022",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
