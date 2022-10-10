import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/verification_code_cubit/verifiaction_code_cubit.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            numberInput(context, true, false),
            numberInput(context, false, false),
            numberInput(context, false, false),
            numberInput(context, false, true)
          ]
        ),
      )
    );
  }
}

Widget numberInput(BuildContext context, bool isFirst, bool isLast) {
  return SizedBox(
    height: 64,
    width: 64,
    child: TextField(
      onChanged: (value) {
        if(value.length == 1) {
          context.read<VerificationCodeCubit>().addNumber(int.parse(value));
          if(isLast) {
            FocusScope.of(context).unfocus();
            context.read<VerificationCodeCubit>().validate();
          } else {
            FocusScope.of(context).nextFocus();
          }
        } else if(value.isEmpty) {
          context.read<VerificationCodeCubit>().deleteNumber();
          if(isFirst) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        }
      },
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      style: TextStyle(fontSize: 20.sp)
    )
  );
}