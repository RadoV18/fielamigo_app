import 'package:flutter/material.dart';

class ConfirmPasswordInput extends StatelessWidget {

  final Function(String) onChange;
  final bool displayError;

  const ConfirmPasswordInput({
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
        labelText: 'Confirmar contraseña',
        helperText: '',
        errorText: displayError
          ? 'Las contraseñas no coinciden.'
          : null
      )
    );
  }
}
