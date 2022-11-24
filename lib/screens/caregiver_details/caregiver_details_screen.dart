import 'package:fielamigo_app/screens/caregiver_details/widgets/caregiver_profile.dart';
import 'package:flutter/material.dart';

import '../../widgets/biography_card.dart';
import '../../widgets/custom_app_bar.dart';

class CaregiverDetailsScreen extends StatelessWidget {
  final int userId;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final int reviewCount;
  final double rating;
  final double price;
  final String zone;
  final String city;
  final String priceDetails;
  final String? imageUrl;

  const CaregiverDetailsScreen({
    super.key,
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.isVerified = false,
    this.reviewCount = 0,
    this.rating = 0,
    required this.price,
    required this.priceDetails,
    required this.zone,
    required this.city,
    this.imageUrl
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
              firstName: firstName,
              lastName: lastName,
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
                  CaregiverProfile(),
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