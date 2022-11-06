import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/custom_date_picker.dart';
import 'package:fielamigo_app/widgets/custom_image_picker.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
          child: CustomScrollView (
            slivers: [
              SliverFillRemaining(
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
                              // imagePath: context.read<PersonalInformationCubit>().state.image!.path,
                              // onImageSelected: (image) => context.read<PersonalInformationCubit>().setImage(image),
                              imagePath: "",
                              onImageSelected: (image) => print(""),
                            ),
                            // Name
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Nombre"
                              ),
                              // onChanged: (value) => context.read<PersonalInformationCubit>().setName(value),
                              onChanged: (value) => print(""),
                            ),
                            const SizedBox(height: 20),
                            // Last name
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Apellido"
                              ),
                              // onChanged: (value) => context.read<PersonalInformationCubit>().setLastName(value),
                              onChanged: (value) => print(""),
                            ),
                            const SizedBox(height: 20),
                            // Phone number
                            TextField(
                              enabled: canEdit,
                              decoration: const InputDecoration(
                                labelText: "Teléfono"
                              ),
                              keyboardType: TextInputType.phone,
                              // onChanged: (value) => context.read<PersonalInformationCubit>().setPhoneNumber(value),
                              onChanged: (value) => print(""),
                            ),
                            const SizedBox(height: 20),
                            // Birthdate
                            CustomDatePicker(
                              enabled: canEdit,
                              // onDateChanged: (date) => context.read<PersonalInformationCubit>().setBirthdate(date),
                              onDateChanged: (date) => print(date),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        // Cancel and save buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancelar"),
                            ),
                            ElevatedButton(
                              // TODO: save data
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Guardar"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}