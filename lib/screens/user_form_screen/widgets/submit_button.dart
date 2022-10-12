import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {print("tap");},
      child: Text(
        "Finalizar Registro",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}