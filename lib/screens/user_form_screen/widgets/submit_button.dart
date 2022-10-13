import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/user_data_cubit/user_data_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<UserDataCubit>().submit();
      },
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