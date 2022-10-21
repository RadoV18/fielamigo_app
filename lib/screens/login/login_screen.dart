import 'package:fielamigo_app/bloc/log_in_cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/email_input.dart';
import '../../widgets/password_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<LogInCubit, LogInState> (
              builder: (context, state) => Container(
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
                          const Text("Iniciar sesión")
                        ]
                      )
                    ),
                    EmailInput(
                      onChange: (String email) =>
                        context.read<LogInCubit>().setEmail(email)
                    ),
                    PasswordInput(
                      onChange: (String password) =>
                        context.read<LogInCubit>().setPassword(password)
                    ),
                    SizedBox(height: 5.h),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LogInCubit>().submit();
                        // TODO: check if user is logged in
                        Navigator.pushNamed(context, "/owner/home");
                      },
                      child: const Text("Iniciar sesión")
                    ),
                    ElevatedButton( //TODO: remove after testing
                      onPressed: () {
                        context.read<LogInCubit>().submit();
                        // TODO: check if user is logged in
                        Navigator.pushNamedAndRemoveUntil(context, "/caregiver/home", (_)=>false);
                      },
                      child: const Text("Caregiver Test")
                    ),
                    SizedBox(height: 2.5.h),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/sign-up"),
                      child: const Text("¿No tienes cuenta? Regístrate")
                    )
                  ]
                )
              ),
            )
          )
        )
      )
    );
  }
}