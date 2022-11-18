import 'package:fielamigo_app/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';

class BoardingDateRange extends StatelessWidget {
  const BoardingDateRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "¿Cuándo?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomDatePicker(
          label: 'Fecha de Inicio',
          // TODO: change to cubit
          onDateChanged: (date) => print(date),
        ),
        CustomDatePicker(
          label: 'Fecha de Salida',
          // TODO: change to cubit
          onDateChanged: (date) => print(date),
        ),
      ],
    );
  }
}
