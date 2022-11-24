import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/page_status.dart';
import '../../bloc/user_data_cubit/user_data_cubit.dart';
import '../../data/models/catalog_dto.dart';
import '../../utils/ui_utils.dart';

class ProfileUserAddressScreen extends StatefulWidget {
  const ProfileUserAddressScreen({super.key});

  @override
  State<ProfileUserAddressScreen> createState() => _ProfileUserAddressScreenState();
}

class _ProfileUserAddressScreenState extends State<ProfileUserAddressScreen> {
  bool canEdit = false;

  @override
  Widget build(BuildContext context) {
    List<CatalogDto> cities = [
      CatalogDto(id: 333, name: "La Paz"),
      CatalogDto(id: 334, name: "Cochabamba"),
      CatalogDto(id: 335, name: "Santa Cruz de la Sierra"),
    ];

    List<CatalogDto> countries = [
      CatalogDto(id: 332, name: "Bolivia")
    ];

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
      body: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          if(state.status == PageStatus.loading) {
            UiUtils.showAlertDialog(
              context,
              message: "Cargando...",
              isDismissible: false,
              hasCircularProgressIndicator: true
            );
          } else if(state.status == PageStatus.success) {
            UiUtils.showAlertDialog(
              context,
              message: "Dirección guardada con éxito",
              isDismissible: true,
              onOkButtonPressed: () {
                Navigator.pop(context, true);
                Navigator.pop(context);
              },
            );
          } else if(state.status == PageStatus.error) {
            Navigator.pop(context, true);
            UiUtils.showAlertDialog(
              context,
              message: "Error al guardar la dirección",
              isDismissible: true,
              onOkButtonPressed: () {
                Navigator.pop(context, true);
              },
            );
          }
        },
        builder: (context, state) {
          // data from bloc
          int? selectedCity;
          var result = cities.where((e) => e.id == state.city).toList();
          if(result.isNotEmpty) {
            selectedCity = result[0].id;
          }

          int? selectedCountry;
          var resultCountry = countries.where((e) => e.id == state.country).toList();
          if(resultCountry.isNotEmpty) {
            selectedCountry = resultCountry[0].id;
          }

          return SafeArea(
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
                            onChanged: (value) => context.read<UserDataCubit>().setAddress1(value),
                            // onChanged: (value) => print(value),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            enabled: canEdit,
                            decoration: const InputDecoration(
                              labelText: "Línea de dirección 2",
                              hintText: "Depto, edificio, piso, etc."
                            ),
                            onChanged: (value) => context.read<UserDataCubit>().setAddress2(value),
                            // onChanged: (value) => print(value),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            enabled: canEdit,
                            decoration: const InputDecoration(
                              labelText: "Zona",
                            ),
                            onChanged: (value) => context.read<UserDataCubit>().setZone(value),
                            // onChanged: (value) => print(value),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButton(
                                  value: selectedCountry,
                                  isExpanded: true,
                                  hint: const Text("País"),
                                  items: <CatalogDto>[
                                    CatalogDto(id: 332, name: "Bolivia")
                                  ]
                                    .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name)
                                    ))
                                    .toList(),
                                  onChanged: canEdit ? (value) {
                                    if(value != null) {
                                      context.read<UserDataCubit>().setCountry(int.parse(value.toString()));
                                    }
                                  } : null,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Expanded(
                                child: DropdownButton(
                                  value: selectedCity,
                                  isExpanded: true,
                                  hint: const Text("Ciudad"),
                                  items: cities
                                    .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name)
                                    ))
                                    .toList(),
                                  onChanged: canEdit ? (value) {
                                    context.read<UserDataCubit>().setCity(int.parse(value.toString()));
                                  } : null,
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
                              onPressed: () => context.read<UserDataCubit>().submit(),
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
        );
        },
      )
    );
  }
}