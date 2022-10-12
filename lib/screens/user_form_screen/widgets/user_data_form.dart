import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';class UserDataForm extends StatelessWidget {
  const UserDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ingresa tus datos personales:",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          TextFormField(
            onChanged: (value) {
              // TODO: set name on bloc
              print(value);
            },
            decoration: const InputDecoration(
              labelText: "Nombre"
            )
          ),
          TextFormField(
            onChanged: (value) {
              // TODO: set last name on bloc
              print(value);
            },
            decoration: const InputDecoration(
              labelText: "Apellido"
            )
          ),
          TextFormField(
            onChanged: (value) {
              // TODO: set phone number on bloc
              print(value);
            },
            decoration: const InputDecoration(
              labelText: "Teléfono"
            )
          ),
          Row(
            children: [
              const Text("Fecha de Nacimiento:"),
              SizedBox(width: 5.w),
              Expanded (
                child: TextFormField(
                  initialValue: null,
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
                      // TODO: set date on cubit
                      print(pickedDate);
                    }
                  }
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}