import 'package:fielamigo_app/bloc/verification_code_cubit/verifiaction_code_cubit.dart';
import 'package:fielamigo_app/screens/verification_code/widgets/header.dart';
import 'package:fielamigo_app/screens/verification_code/widgets/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/page_status.dart';
import '../../utils/ui_utils.dart';
class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerificationCodeCubit>(
      create: (BuildContext context) => VerificationCodeCubit(),
      child: Scaffold(
        body: BlocConsumer<VerificationCodeCubit, VerificationCodeState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if(state.status == PageStatus.success) {
              UiUtils.showAlertDialog(context,
                message: "Cuenta verificada.",
                isDismissible: true,
                hasCircularProgressIndicator: false,
                onOkButtonPressed: () {
                  Navigator.of(context)
                    .pushNamedAndRemoveUntil('/log-in', (Route<dynamic> route) => false);
                },
              );
            } else if (state.status == PageStatus.loading) {
              UiUtils.showAlertDialog(
                context,
                message: 'Verificando código...',
                isDismissible: false,
                hasCircularProgressIndicator: true,
              );
            } else if (state.status == PageStatus.error) {
              Navigator.of(context, rootNavigator: true).pop();
              UiUtils.showAlertDialog(
                context,
                title: "Error",
                message: "Error al verificar el código",
                isDismissible: true
              );
            }
          },
          builder: (context, state) => Column(
            children: [
                SizedBox(height: 10.h),
                const Header(),
                SizedBox(height: 10.h),
                const VerificationCodeInput(),
                // _ConfirmButton()
              ]
            ),
        )
      )
    ); 
  }
}
