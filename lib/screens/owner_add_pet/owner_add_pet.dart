import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/screens/owner_add_pet/widgets/breed_autocomplete.dart';
import 'package:fielamigo_app/widgets/custom_image_picker.dart';
import 'package:fielamigo_app/screens/owner_add_pet/widgets/male_female_options.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dog_cubit/dog_cubit.dart';
import '../../bloc/page_status.dart';
import '../../utils/ui_utils.dart';
import 'widgets/dog_size_options.dart';

class OwnerAddPetScreen extends StatelessWidget {
  const OwnerAddPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Agregar Mascota',
      ),
      body: BlocConsumer<AddPetCubit, AddPetState>(
        listenWhen: ((previous, current) => previous.status != current.status),
        listener: (context, state) {
          if (state.status == PageStatus.success) {
            Navigator.pop(context, true);
            UiUtils.showAlertDialog(
              context,
              message: "Su mascota ha sido agregada con éxito",
              isDismissible: true,
              onOkButtonPressed: () {
                context.read<DogCubit>().init();
                context.read<AddPetCubit>().clear();
                Navigator.pop(context, true);
                Navigator.pop(context);
              },);
          } else if(state.status == PageStatus.loading) {
            UiUtils.showAlertDialog(
              context,
              message: "Guardando datos...",
              isDismissible: false,
              hasCircularProgressIndicator: true
            );
          } else if(state.status == PageStatus.error) {
            Navigator.pop(context, true);
            UiUtils.showAlertDialog(
              context,
              message: "Ocurrió un error, intente nuevamente.",
              isDismissible: true
            );
          }
        },
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
                          CustomImagePicker(
                            imagePath: state.image?.path ?? "",
                            onImageSelected: (image) => context.read<AddPetCubit>().setImage(image),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Nombre",
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
                          CustomDatePicker(
                            label: "Fecha de nacimiento",
                            onDateChanged: (String date) {
                              context.read<AddPetCubit>().setBirthDate(date);
                            },
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
                              labelText: "Notas",
                              hintText: "Agrega algún detalle sobre tu mascota.",
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
