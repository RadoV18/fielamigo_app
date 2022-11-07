import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileUserAddressScreen extends StatefulWidget {
  const ProfileUserAddressScreen({super.key});

  @override
  State<ProfileUserAddressScreen> createState() => _ProfileUserAddressScreenState();
}

class _ProfileUserAddressScreenState extends State<ProfileUserAddressScreen> {
  // TODO: check if the user doesn't have any data in the database
  // if so, then canEdit = true
  bool canEdit = false;

  @override
  Widget build(BuildContext context) {
    // data from bloc
    // String country = context.read<UserDataCubit>().state.country;
    // String city = context.read<UserDataCubit>().state.city;
    String country = "";
    String city = "";
    // string to show in the dropdown
    String? countryValue = country == '' ? null : country;
    String? cityValue = city == '' ? null : city;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Dirección',
        actionButton: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () =>
            setState(() {
              canEdit = true;
            }),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextField(
                          enabled: canEdit,
                          decoration: const InputDecoration(
                            labelText: "Línea de dirección 1",
                            hintText: "Nombre de la calle"
                          ),
                          // onChanged: (value) => context.read<AddressCubit>().setAddress1(value),
                          onChanged: (value) => print(value),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          enabled: canEdit,
                          decoration: const InputDecoration(
                            labelText: "Línea de dirección 2",
                            hintText: "Depto, edificio, piso, etc."
                          ),
                          // onChanged: (value) => context.read<AddressCubit>().setAddress2(value),
                          onChanged: (value) => print(value),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          enabled: canEdit,
                          decoration: const InputDecoration(
                            labelText: "Zona",
                          ),
                          // onChanged: (value) => context.read<AddressCubit>().setAddress2(value),
                          onChanged: (value) => print(value),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButton(
                                value: countryValue,
                                isExpanded: true,
                                hint: const Text("País"),
                                // TODO: from http request
                                items: const ['abc', 'def', 'ghi']
                                  .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e)
                                  ))
                                  .toList(),
                                onChanged: canEdit ? (value) {
                                  print("new value $value");
                                  // context.read<UserDataCubit>().setCountry(value ?? '');
                                } : null,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: const Text("Ciudad"),
                                // TODO: from http request
                                items: const ['abc', 'def', 'ghi']
                                  .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e)
                                  ))
                                  .toList(),
                                onChanged: canEdit ? (value) {
                                  // context.read<UserDataCubit>().setCity(value ?? '');
                                } : null,
                                value: cityValue,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // buttons for cancel and save
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancelar"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Guardar"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
        )
      )
    );
  }
}