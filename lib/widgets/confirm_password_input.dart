import 'package:flutter/material.dart';

class ConfirmPasswordInput extends StatelessWidget {

  final Function(String?) onChange;

  const ConfirmPasswordInput({
    super.key,
    required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      enableInteractiveSelection: false,
      decoration: const InputDecoration(
        labelText: 'Confirmar contraseña',
        helperText: '',
        errorText: ''
      )
    );
  }
}
