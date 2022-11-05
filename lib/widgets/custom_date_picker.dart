import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // change the date format to dd/mm/yyyy
    if(dateController.text != '') {
      int year = int.parse(dateController.text.substring(0, 4));
      int month = int.parse(dateController.text.substring(5, 7));
      int day = int.parse(dateController.text.substring(8, 10));
      String dateValue = '$day/$month/$year';
      dateController.text = dateValue;
    }   

    return Expanded (
      child: TextFormField(
        controller: dateController,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          hintText: "dd / mm / aaaa"
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now()
          );
          if (pickedDate != null) {
            setState(() {
              // rebuild the widget to update the date on bloc
              dateController.text = pickedDate.toIso8601String();  
            });
          }
        }
      ),
    );
  }
}
