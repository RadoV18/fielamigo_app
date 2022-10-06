import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:sizer/sizer.dart';

class PasswordStrengthMeter extends StatelessWidget {
  
  final String password;
  final Function(double?) callbackStrength;
  final String passwordStrength;
  
  const PasswordStrengthMeter({
    super.key,
    required this.password,
    required this.callbackStrength,
    required this.passwordStrength
  });

  @override
  Widget build(BuildContext context) {
     return Column(
        children: [
          SizedBox(
            width: 100.w,
            child: const Text(
              "Nivel de seguridad de la contraseña:",
              textAlign: TextAlign.left
            )
          ),
          const SizedBox(height: 10.0),
          FlutterPasswordStrength(
            password: password,
            height: 2.h,
            radius: 10.0,
            strengthCallback: callbackStrength,
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            width: 100.w,
            child: Text(passwordStrength, textAlign: TextAlign.left)
          ),
        ],
      );
  }
}