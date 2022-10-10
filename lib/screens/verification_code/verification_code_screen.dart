import 'package:fielamigo_app/bloc/verification_code_cubit/verifiaction_code_cubit.dart';
import 'package:fielamigo_app/screens/verification_code/widgets/header.dart';
import 'package:fielamigo_app/screens/verification_code/widgets/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            SizedBox(height: 10.h),
            const Header(),
            SizedBox(height: 10.h),
            const VerificationCodeInput(),
            // _ConfirmButton()
          ]
        )
    );
  }
}
