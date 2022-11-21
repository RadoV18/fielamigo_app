import 'package:fielamigo_app/screens/sign_up/widgets/sign_up_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/page_status.dart';
import '../../bloc/sign_up_cubit/sign_up_cubit.dart';
import '../../data/models/email.dart';
import '../../data/models/password.dart';
import '../../utils/ui_utils.dart';
import 'widgets/account_type_selector.dart';
import '../../widgets/confirm_password_input.dart';
import '../../widgets/email_input.dart';
import '../../widgets/password_input.dart';
import '../../widgets/password_strength_meter.dart';
import 'widgets/account_details.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if(state.status == PageStatus.loading) {
          UiUtils.showAlertDialog(
            context,
            message: 'Creando cuenta...',
            isDismissible: false,
            hasCircularProgressIndicator: true,
          );
        } else if(state.status == PageStatus.success) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushNamed(context, "/verification-code");
        } else if(state.status == PageStatus.error) {
          Navigator.of(context, rootNavigator: true).pop();
          UiUtils.showAlertDialog(
            context,
            title: "Error",
            message: "Error al registrar el usuario",
            isDismissible: true
          );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        Email email = context.read<SignUpCubit>().state.email;
        Password password = context.read<SignUpCubit>().state.password;
        Password confirmPassword = context.read<SignUpCubit>().state.confirmPassword;

        bool displayEmailError = !email.valid && email.value.isNotEmpty;
        bool displayPasswordError = !password.valid && password.value.isNotEmpty;
        bool displayConfirmError = password.value != confirmPassword.value;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    5.w, 7.5.h, 5.w,
                    MediaQuery.of(context).viewInsets.bottom
                  ),
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
                      EmailInput(
                        onChange: (String email) =>
                          context.read<SignUpCubit>().setEmail(email),
                        displayError: displayEmailError,
                      ),
                      PasswordInput(
                        onChange: (String password) =>
                          context.read<SignUpCubit>().setPassword(password),
                        displayError: displayPasswordError,
                      ),
                      ConfirmPasswordInput(
                        onChange: (String password) =>
                          context.read<SignUpCubit>().setConfirmPassword(password),
                        displayError: displayConfirmError,
                      ),
                      PasswordStrengthMeter(
                        callbackStrength: (double str) =>
                          context.read<SignUpCubit>().setStrength(str),
                        password: state.password.value,
                        passwordStrength: context.read<SignUpCubit>().state.passwordStrength,
                      ),
                      SizedBox(height: 2.5.h),
                      const AccountTypeSelector(),
                      SizedBox(height: 2.5.h),
                      const AccountDetails(),
                      SizedBox(height: 2.5.h),
                      const SignUpButtons(),
                    ]
                  ),
                ),
              ),
            ),
          ),
        );
      } 
    );
  }
}
