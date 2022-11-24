import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/boarding_cubit/boarding_cubit.dart';

class BoardingConfirmationScreen extends StatelessWidget {
  const BoardingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // reservation confirmation screen with icon
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            const Text(
              "Reserva Solicitada",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 50.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff047b5b),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/owner/home', (Route<dynamic> route) => false);
                  context.read<BoardingCubit>().clear();
                },
                child: const Text("Volver al inicio"),
              ),
            )
          ],
        ),
      ),
    );
    
  }
}