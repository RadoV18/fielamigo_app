import 'package:fielamigo_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/add_pet_cubit/add_pet_cubit.dart';

class DogSizeOptions extends StatelessWidget {
  const DogSizeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPetCubit, AddPetState>(
      buildWhen: (previous, current) => previous.isSmall != current.isSmall
          || previous.isMedium != current.isMedium
          || previous.isLarge != current.isLarge,
      builder: (context, state) {
        return Column(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomRadioButton(
                  onPressed: () => context.read<AddPetCubit>().setSmall(),
                  text: "Pequeño",
                  icon: SvgPicture.asset(
                    "assets/icons/ic_dog_size_sm.svg",
                    height: 50,
                  ),
                  isSelected: context.read<AddPetCubit>().state.isSmall,
                ),
              ),
              SizedBox(width: 1.h),
              Expanded(
                flex: 1,
                child: CustomRadioButton(
                  onPressed: () => context.read<AddPetCubit>().setMedium(),
                  text: "Mediano",
                  icon: SvgPicture.asset(
                    "assets/icons/ic_dog_size_md.svg",
                    height: 50,
                  ),
                  isSelected: context.read<AddPetCubit>().state.isMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          CustomRadioButton(
            onPressed: () => context.read<AddPetCubit>().setLarge(),
            text: "Grande",
            icon: SvgPicture.asset(
              "assets/icons/ic_dog_size_xl.svg",
              height: 50,
            ),
            isSelected: context.read<AddPetCubit>().state.isLarge,
          ),
        ]);
      },
    );
  }
}
