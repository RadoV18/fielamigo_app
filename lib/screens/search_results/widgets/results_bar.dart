import 'package:flutter/material.dart';

class ResultsBar extends StatelessWidget {
  const ResultsBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                    hint: const Text("Ordenar por..."),
                    items: ['Precio', 'Calificación', 'Zona']
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (value) => print(value),
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