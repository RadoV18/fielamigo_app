import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

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
              "Ingresa tu dirección:",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          TextFormField(
            onChanged: (value) {
              print(value);
            },
            decoration: const InputDecoration(
              labelText: "Calle"
            )
          ),
          TextFormField(
            onChanged: (value) {
              print(value);
            },
            decoration: const InputDecoration(
              labelText: "Dpto., edificio, piso, etc."
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text("País"),
                  // TODO: from http request
                  items: const ['abc', 'def', 'ghi']
                    .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e)
                    ))
                    .toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text("Ciudad"),
                  // TODO: from http request
                  items: const ['abc', 'def', 'ghi']
                    .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e)
                    ))
                    .toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              )
            ],
          )
        ]
      )
    );
  }
}