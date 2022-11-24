import 'package:fielamigo_app/bloc/boarding_cubit/boarding_cubit.dart';
import 'package:fielamigo_app/screens/caregiver_booking_request/caregiver_booking_request_screen.dart';
import 'package:fielamigo_app/screens/caregiver_details/widgets/caregiver_profile.dart';
import 'package:fielamigo_app/screens/caregiver_details/widgets/caregiver_reviews.dart';
import 'package:fielamigo_app/screens/caregiver_details/widgets/caregiver_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_profile_page_cubit/user_profile_page_cubit.dart';
import '../../widgets/biography_card.dart';
import '../../widgets/custom_app_bar.dart';

class CaregiverDetailsScreen extends StatelessWidget {
  final int boardingServiceId;
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
  final double? pickupRate;

  const CaregiverDetailsScreen({
    super.key,
    required this.boardingServiceId,
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
    this.imageUrl,
    this.pickupRate,
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
              isVerified: isVerified,
              rating: rating,
              reviewCount: reviewCount,
              zone: zone,
              city: city,
              onContactPressed: () {
                context.read<BoardingCubit>().setBoardingServiceId(boardingServiceId);
                DateTime startingDate = context.read<BoardingCubit>().state.startingDate!;
                DateTime endingDate = context.read<BoardingCubit>().state.endingDate!;
                int nightCount = endingDate.difference(startingDate).inDays;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaregiverBookingRequestScreen(
                    title: "Detalles de la Reserva",
                    detailName: "$firstName $lastName",
                    startDate: context.read<BoardingCubit>().state.startingDate,
                    endDate: context.read<BoardingCubit>().state.endingDate,
                    dogs: context.read<BoardingCubit>().state.dogs,
                    nightCount: nightCount,
                    price: price,
                    pickupRate: pickupRate,
                    city: city,
                    zone: zone,
                    isCaregiver: false,
                  )),
                );
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
            Flexible(
              flex: 3,
              child: BlocProvider<UserProfilePageCubit>(
                create: (context) => UserProfilePageCubit()..init(userId),
                child: TabBarView(
                  children: [
                    CaregiverProfile(firstName: firstName),
                    CaregiverServices(firstName: firstName),
                    CaregiverReviews(firstName: firstName),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}