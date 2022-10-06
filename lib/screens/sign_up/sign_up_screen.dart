import 'package:fielamigo_app/screens/sign_up/widgets/sign_up_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/sign_up_cubit/sign_up_cubit.dart';
import '../../widgets/account_type_selector.dart';
import '../../widgets/confirm_password_input.dart';
import '../../widgets/email_input.dart';
import '../../widgets/password_input.dart';
import '../../widgets/password_strength_meter.dart';
import 'widgets/account_details.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(5.w, 7.5.h, 5.w, MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                            child: Image.asset('assets/images/logo.png')
                          ),
                          const Text("Regístrate")
                        ]
                      )
                    ),
                    Column(
                      children: [
                        EmailInput(onChange: (String? s) { print(s); }),
                        PasswordInput(onChange: (String? s) { print(s); }),
                        ConfirmPasswordInput(onChange: (String? s) { print(s); }),
                        PasswordStrengthMeter(
                          callbackStrength: (double? s) { print(s); },
                          password: '',
                          passwordStrength: '',
                        ),
                        SizedBox(height: 2.5.h),
                        const AccountTypeSelector(),
                        SizedBox(height: 2.5.h),
                        const AccountDetails(),
                        SizedBox(height: 2.5.h),
                        const SignUpButtons(),
                      ],
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
