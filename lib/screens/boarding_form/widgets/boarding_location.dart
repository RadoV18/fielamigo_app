import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../../data/models/catalog_dto.dart';

class BoardingLocation extends StatelessWidget {
  const BoardingLocation({super.key});

  @override
  Widget build(BuildContext context) {

    List<CatalogDto> cities = [
      CatalogDto(id: 333, name: "La Paz"),
      CatalogDto(id: 334, name: "Cochabamba"),
      CatalogDto(id: 335, name: "Santa Cruz de la Sierra"),
    ];

    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        int? selectedValue;
        var result = cities.where((e) => e.id == state.cityId).toList();
        if(result.isNotEmpty) {
          selectedValue = result[0].id;
        }
        print("selectedValue: ${selectedValue}");
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "¿Dónde?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: selectedValue,
              isExpanded: true,
              hint: const Text("Selecciona una ciudad"),
              items: cities
                  .map(
                    (CatalogDto e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) => context.read<BoardingCubit>().setCityId(int.parse(value.toString())),
            ),
          ),
        ],
      );
      },
    );
  }
}