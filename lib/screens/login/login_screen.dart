import 'package:fielamigo_app/bloc/log_in_cubit/log_in_cubit.dart';
import 'package:fielamigo_app/bloc/user_info_cubit/user_info_cubit.dart';
import 'package:fielamigo_app/screens/owner_home/owner_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import '../../bloc/page_status.dart';
import '../../utils/token_utils.dart';
import '../../utils/ui_utils.dart';
import '../../widgets/email_input.dart';
import '../../widgets/password_input.dart';
import '../caregiver_home/caregiver_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInCubit>(
      create: (BuildContext context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInState>(
        listenWhen:(previous, current) => previous.status != current.status,
        listener: (context, state) async {
          if (state.status == PageStatus.loading) {
            UiUtils.showAlertDialog(
              context,
              message: "Iniciando sesión...",
              hasCircularProgressIndicator: true,
              isDismissible: false
            );
          } else if (state.status == PageStatus.success) {
            context.read<BottomNavBarCubit>().reset();
            Navigator.of(context, rootNavigator: true).pop();

            FlutterSecureStorage storage = const FlutterSecureStorage();

            String? token = await storage.read(key: "token");
            String? firstName = TokenUtils.getFirstName(token!);
            String? lastName = TokenUtils.getLastName(token);
            int? userId = TokenUtils.getUserId(token);
            bool? isOwner = TokenUtils.checkIsOwner(token);

            context.read<UserInfoCubit>().setUserInfo(
              userId, firstName, lastName, isOwner
            );

            Navigator.popUntil(context, (Route<dynamic> route) => false);
            
            if(state.isOwner) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OwnerHomeScreen()
                )
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaregiverHomeScreen()
                )
              );
            }
            context.read<LogInCubit>().reset();
          } else if (state.status == PageStatus.error) {
            Navigator.of(context, rootNavigator: true).pop();
            UiUtils.showAlertDialog(
              context,
              title: "Error",
              message: "Usuario y/o contraseña incorrectos.",
              isDismissible: true
            );
            context.read<LogInCubit>().setStatus(PageStatus.initial);
          }
        },
        builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                    child: Center(
                        child: BlocBuilder<LogInCubit, LogInState>(
                  builder: (context, state) => Container(
                      padding: EdgeInsets.fromLTRB(5.w, 7.5.h, 5.w,
                          MediaQuery.of(context).viewInsets.bottom),
                      child: Column(children: [
                        SizedBox(
                            height: 20.h,
                            child: Column(children: [
                              SizedBox(
                                  height: 15.h,
                                  child: Image.asset('assets/images/logo.png')),
                              const Text("Iniciar sesión")
                            ])),
                        EmailInput(
                            onChange: (String email) =>
                                context.read<LogInCubit>().setEmail(email)),
                        PasswordInput(
                            onChange: (String password) =>
                                context.read<LogInCubit>().setPassword(password)),
                        SizedBox(height: 5.h),
                        ElevatedButton(
                            onPressed: () {
                              context.read<LogInCubit>().submit();
                            },
                            child: const Text("Iniciar sesión")),
                        ElevatedButton(
                            //TODO: remove after testing
                            onPressed: () {
                              context.read<LogInCubit>().submit();
                              // TODO: check if user is logged in
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/caregiver/home", (_) => false);
                            },
                            child: const Text("Caregiver Test")),
                        SizedBox(height: 2.5.h),
                        TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/sign-up"),
                            child: const Text("¿No tienes cuenta? Regístrate"))
                      ])),
                ))))),
      ),
    );
  }
}
