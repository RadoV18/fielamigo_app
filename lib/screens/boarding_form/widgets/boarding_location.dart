import 'package:flutter/material.dart';

class BoardingLocation extends StatelessWidget {
  const BoardingLocation({super.key});

  @override
  Widget build(BuildContext context) {
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
            isExpanded: true,
            hint: const Text("Selecciona una ciudad"),
            items: ['a', 'b', 'c']
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (value) => print(value),
          ),
        ),
      ],
    );
  }
}