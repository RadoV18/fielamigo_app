import 'package:flutter/material.dart';
import '../../widgets/biography_card.dart';
import '../../widgets/custom_app_bar.dart';

class OwnerBookingsEditScreen extends StatelessWidget {
  final int userId;
  final String service;

  const OwnerBookingsEditScreen(
      {super.key, required this.userId, required this.service});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: CustomAppBar(
            onBackButtonPressed: () => Navigator.pop(context),
            title: 'Editar reserva',
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // profile card
              BiographyCard(
                userId: userId,
                firstName: "Alex",
                lastName: "Quiroga",
                isVerified: true,
                rating: 4.3,
                reviewCount: 12,
                zone: "Miraflores",
                city: "La Paz",
                onContactPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              /* two buttons in column with the background blue */
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xff3a5080),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (_) => false);
                        },
                        child: const Text("Cancelar reservas")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (_) => false);
                        },
                        child: const Text("Solicitar cambio de fecha")),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
