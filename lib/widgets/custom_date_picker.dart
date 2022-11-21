import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final void Function(String) onDateChanged;
  final bool enabled;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? initialValue;
    
  const CustomDatePicker({
    super.key,
    required this.label,
    required this.onDateChanged,
    this.enabled = true,
    this.firstDate,
    this.lastDate,
    this.initialValue
  });
  

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if there is an initial value
    if (widget.initialValue != null) {
      int year = int.parse(widget.initialValue!.substring(0, 4));
      int month = int.parse(widget.initialValue!.substring(5, 7));
      int day = int.parse(widget.initialValue!.substring(8, 10));
      String dateValue = '$day/$month/$year';
      dateController.text = dateValue;
    }

    // change the date format to dd/mm/yyyy
    if(dateController.text != '' && !dateController.text.contains("/")) {
      widget.onDateChanged(dateController.text);
      int year = int.parse(dateController.text.substring(0, 4));
      int month = int.parse(dateController.text.substring(5, 7));
      int day = int.parse(dateController.text.substring(8, 10));
      String dateValue = '$day/$month/$year';
      dateController.text = dateValue;
    }   

    return TextField(
      controller: dateController,
      decoration: InputDecoration(
        // icon: Icon(Icons.calendar_today),
        labelText: widget.label,
      ),
      enabled: widget.enabled,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: widget.firstDate ?? DateTime(1900),
          lastDate: widget.lastDate ?? DateTime.now()
        );
        if (pickedDate != null) {
          setState(() {
            // rebuild the widget to update the date on bloc
            dateController.text = pickedDate.toIso8601String();
          });
        }
      }
    );
  }
}
