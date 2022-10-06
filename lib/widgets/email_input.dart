import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  
  final Function(String?) onChange;
  
  const EmailInput({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
      return TextField(
        onChanged: onChange,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Correo Electrónico',
          helperText: '',
          errorText: ''
        )
      );
    }
  }