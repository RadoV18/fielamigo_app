import 'package:fielamigo_app/bloc/user_details_cubit/user_details_cubit.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/custom_date_picker.dart';
import 'package:fielamigo_app/widgets/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/page_status.dart';

class ProfilePersonalInformationScreen extends StatefulWidget {
  const ProfilePersonalInformationScreen({super.key});

  @override
  State<ProfilePersonalInformationScreen> createState() => _ProfilePersonalInformationScreenState();
}

class _ProfilePersonalInformationScreenState extends State<ProfilePersonalInformationScreen> {
  // TODO: check if the user doesn't have any data in the database
  // if so, then canEdit = true
  bool canEdit = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDetailsCubit>(
      create:(context) => UserDetailsCubit(),
      child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == PageStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Datos guardados correctamente.'),
              ),
            );
          } else if (state.status == PageStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error al guardar los datos.'),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            onBackButtonPressed: () => Navigator.pop(context),
            title: 'Datos Personales',
            actionButton: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () =>
                setState(() {
                  canEdit = true;
                })
            ),
          ),
          body: SafeArea(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile picture with button
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            CustomImagePicker(
                              enabled: canEdit,
                              imagePath: state.image?.path ?? "",
                              onImageSelected: (image) => context.read<UserDetailsCubit>().setImage(image),
                            ),
                            // Name
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Nombre"
                              ),
                              onChanged: (value) => context.read<UserDetailsCubit>().setFirstName(value),
                            ),
                            const SizedBox(height: 20),
                            // Last name
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Apellido"
                              ),
                              onChanged: (value) => context.read<UserDetailsCubit>().setLastName(value),
                            ),
                            const SizedBox(height: 20),
                            // Phone number
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Teléfono"
                              ),
                              keyboardType: TextInputType.phone,
                              onChanged: (value) => context.read<UserDetailsCubit>().setPhoneNumber(value),
                            ),
                            const SizedBox(height: 20),
                            // Birthdate
                            CustomDatePicker(
                              enabled: canEdit,
                              label: "Fecha de Nacimiento",
                              onDateChanged: (date) => context.read<UserDetailsCubit>().setBirthDate(date),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        // Cancel and save buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancelar"),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => context.read<UserDetailsCubit>().submit(),
                                child: const Text("Guardar"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          )
        ),
      ),
    );
  }
}