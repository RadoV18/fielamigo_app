import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/boarding_cubit/boarding_cubit.dart';

class BoardingDateRange extends StatefulWidget {
  const BoardingDateRange({super.key});

  @override
  State<BoardingDateRange> createState() => _BoardingDateRangeState();
}

class _BoardingDateRangeState extends State<BoardingDateRange> {
  TextEditingController startingDateController = TextEditingController();
  TextEditingController endingDateController = TextEditingController();

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
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: startingDateController,
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: "Fecha de Inicio",
          ),
          enabled: false,
          readOnly: true,
          onTap: (){},
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: endingDateController,
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: "Fecha de Salida",
          ),
          enabled: false,
          readOnly: true,
          onTap: (){},
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed:() async {
              DateTimeRange? result = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                helpText: "Selecciona un rango de fechas",
                saveText: "Aceptar",
                cancelText: "Cancelar",
              );

              if(result != null) {
                setState(() {
                  startingDateController.text = "${result.start.day}/${result.start.month}/${result.start.year}";
                  endingDateController.text = "${result.end.day}/${result.end.month}/${result.end.year}";
                });
                // ignore: use_build_context_synchronously
                context.read<BoardingCubit>().setStartingDate(result.start);
                // ignore: use_build_context_synchronously
                context.read<BoardingCubit>().setEndingDate(result.end);
              }
            },
            child: const Text("Seleccionar Fechas"),
          ),
        ),
      ],
    );
  }
}
