import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/screens/owner_add_pet/widgets/breed_autocomplete.dart';
import 'package:fielamigo_app/screens/owner_add_pet/widgets/dog_image_picker.dart';
import 'package:fielamigo_app/screens/owner_add_pet/widgets/male_female_options.dart';
import 'package:fielamigo_app/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'widgets/dog_size_options.dart';

class OwnerAddPetScreen extends StatelessWidget {
  const OwnerAddPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text("Agregar Mascota"),
      ),
      body: BlocBuilder<AddPetCubit, AddPetState>(
        builder: (context, state) {
          return SafeArea(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const DogImagePicker(),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Nombre",
                            ),
                            onChanged: (value) =>
                                context.read<AddPetCubit>().setName(value),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const BreedAutocomplete(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text("Fecha de Nacimiento:"),
                              SizedBox(width: 5.w),
                              CustomDatePicker(
                                onDateChanged: (String date) {
                                  context.read<AddPetCubit>().setBirthDate(date);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const MaleFemaleOptions(),
                          const Divider(
                            thickness: 1,
                            height: 30,
                            color: Color(0xFFBDBDBD),
                          ),
                          const DogSizeOptions(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: context.read<AddPetCubit>().state.isSterilized,
                                onChanged: (bool? value) {
                                  context.read<AddPetCubit>().setIsSterilized(value!);
                                },
                              ),
                              const Text("Esterilizado."),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: "Notas",
                            ),
                            onChanged: (value) => 
                              context.read<AddPetCubit>().setNotes(value),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10
                              ),
                            ),
                            onPressed: () {
                              context.read<AddPetCubit>().save();
                            },
                            child: const Text("Guardar Mascota"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
