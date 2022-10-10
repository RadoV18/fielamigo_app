import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  
  final Function(String) onChange;
  final bool displayError;

  const PasswordInput({
    super.key,
    required this.onChange,
    this.displayError = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        helperText: '',
        errorText: displayError
          ? 'La contraseña debe contener al menos 12 caracteres.'
          : null,
      )
    );
  }
}
