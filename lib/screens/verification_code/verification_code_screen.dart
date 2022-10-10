import 'package:fielamigo_app/screens/verification_code/widgets/header.dart';
import 'package:fielamigo_app/screens/verification_code/widgets/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sign_up_cubit/sign_up_cubit.dart';
class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: const [
              Header(),
              VerificationCodeInput(),
              // _ConfirmButton()
            ]
          )
      ),
    );
  }
}
