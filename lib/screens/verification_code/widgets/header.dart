import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/sign_up_cubit/sign_up_cubit.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) => SizedBox(
        height: 25.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10.h,
              child: Image.asset('assets/images/logo.png')
            ),
            Text(
              "Antes de comenzar...",
              style: TextStyle(fontSize: 18.sp)
            ),
            Text(
              "Ingresa el código que enviamos a ${context.read<SignUpCubit>().state.email.value}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp
              )
            )
          ]
        )
      ),
    );
  }
}
