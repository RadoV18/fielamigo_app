import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/sign_up_cubit/sign_up_cubit.dart';
class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit()
        )
      ],
      child: Scaffold(
        body: Column(
          children: const [
              _Header(),
              _CodeInput(),
              // _ConfirmButton()
            ]
          )
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

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

class _CodeInput extends StatelessWidget {
  const _CodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: TextField(
              onChanged: (value) {
                FocusScope.of(context).nextFocus();
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: TextField(
              onChanged: (value) {
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: TextField(
              onChanged: (value) {
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: TextField(
              onChanged: (value) {
                if(value.length == 1) {
                  FocusScope.of(context).unfocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          )
        ]
      )
    );
  }
}