import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../../data/models/caregiver_card_dto.dart';
import '../../../widgets/caregiver_card.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        List<CaregiverCardDto> caregivers = state.caregivers;
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => CaregiverCard(
              userId: caregivers[index].caregiverId!,
              firstName: caregivers[index].firstName!,
              lastName: caregivers[index].lastName!,
              isVerified: caregivers[index].isVerified!,
              reviewCount: caregivers[index].reviewCount!,
              rating: caregivers[index].rating!,
              price: caregivers[index].price!,
              pickupRate: caregivers[index].pickupRate!,
              zone: caregivers[index].zone!,
              city: caregivers[index].city!,
              priceDetails: "por noche",
              imageUrl: caregivers[index].imageUrl,
            ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: caregivers.length
        );
      }
    );
  }
}
