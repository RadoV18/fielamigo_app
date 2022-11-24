import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../../data/models/catalog_dto.dart';

class ResultsBar extends StatefulWidget {
  const ResultsBar({super.key});

  @override
  State<ResultsBar> createState() => _ResultsBarState();
}

class _ResultsBarState extends State<ResultsBar> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    List<CatalogDto> options = [
      CatalogDto(id: 1, name: "Precio"),
      CatalogDto(id: 2, name: "Calificación"),
      CatalogDto(id: 3, name: "Zona"),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.filter_alt_rounded),
                  const SizedBox(width: 10),
                  DropdownButton(
                    value: selectedValue,
                    hint: const Text("Ordenar por..."),
                    items: options
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if(value != null) {
                        context.read<BoardingCubit>().orderBy(int.parse(value.toString()));
                        setState(() {
                          selectedValue = int.parse(value.toString());
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}