import 'package:flutter/material.dart';

import '../../widgets/biography_card.dart';
import '../../widgets/custom_app_bar.dart';

class CaregiverDetailsScreen extends StatelessWidget {
  final int userId;

  const CaregiverDetailsScreen({
    super.key,
    required this.userId
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          onBackButtonPressed: () => Navigator.pop(context),
          title: 'Detalles del cuidador',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // profile card
            BiographyCard(
              userId: userId,
              firstName: "Juan",
              lastName: "Perez",
              isVerified: true,
              rating: 4.3,
              reviewCount: 25,
              zone: "Miraflores",
              city: "La Paz",
              onContactPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            // tab bar
            const Material(
              color: Color(0xff3a5080),
              child: TabBar(
                tabs: [
                  Tab(text: 'Perfil'),
                  Tab(text: 'Servicios'),
                  Tab(text: 'Reseñas'),
                ]
              ),
            ),
            // tab controller
            const Flexible(
              flex: 3,
              child: TabBarView(
                children: [
                  Text("Perfil"),
                  Text("Servicios"),
                  Text("Reseñas"),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}