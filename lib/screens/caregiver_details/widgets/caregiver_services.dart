import 'package:fielamigo_app/widgets/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../bloc/user_services_cubit/user_services_cubit.dart';
import '../../../widgets/service_card.dart';

class CaregiverServices extends StatelessWidget {
  final int caregiverId;
  final String firstName;
  final double price;

  const CaregiverServices({
    super.key,
    required this.firstName,
    required this.caregiverId,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ServiceCard(
              icon: SvgPicture.asset('assets/icons/ic_boarding_icon.svg'),
              title: 'Alojamiento',
              subtitle: 'Alojamiento de mascotas',
              price: price,
              priceDetails: 'por noche',
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: Text("Disponibilidad de $firstName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocProvider<UserServicesCubit>(
              create: (context) => UserServicesCubit()..init(caregiverId),
              child: CustomCalendar(
                caregiverId: caregiverId,
              ),
            )
          ],
        ),
      )
    );
  }
}