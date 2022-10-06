import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  
  final Function(String?) onChange;

  const PasswordInput({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      enableInteractiveSelection: false,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        helperText: '',
        errorText: '',
      )
    );
  }
}
