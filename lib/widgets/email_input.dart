import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  
  final Function(String) onChange;
  final bool displayError;
  
  const EmailInput({
    super.key,
    required this.onChange,
    this.displayError = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Correo Electrónico',
        helperText: '',
        errorText: displayError
          ? 'Ingrese un correo electrónico válido'
          : null
      )
    );
  } 
}