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
        height: 20.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
              child: Image.asset('assets/images/logo.png')
            ),
            const Text("Antes de comenzar..."),
            Text("Ingresa el código que enviamos a ${context.read<SignUpCubit>().state.email.value}")
          ]
        )
      ),
    );
  }
}
