import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MaleFemaleOptions extends StatelessWidget {
  const MaleFemaleOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPetCubit, AddPetState>(
      buildWhen: (previous, current) => previous.isMale != current.isMale
        || previous.isFemale != current.isFemale,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                flex: 1,
                child: CustomRadioButton(
                  onPressed: () => context.read<AddPetCubit>().setMale(),
                  text: "Macho",
                  icon: SvgPicture.asset(
                    "assets/icons/ic_dog_male.svg",
                    height: 40,
                  ),
                  isSelected: context.read<AddPetCubit>().state.isMale,
                )),
            SizedBox(width: 1.h),
            Expanded(
              flex: 1,
              child: CustomRadioButton(
                onPressed: () => context.read<AddPetCubit>().setFemale(),
                text: "Hembra",
                icon: SvgPicture.asset(
                  "assets/icons/ic_dog_female.svg",
                  color: Colors.pink,
                  height: 40,
                ),
                isSelected: context.read<AddPetCubit>().state.isFemale,
              ),
            ),
          ],
        );
      },
    );
  }
}
