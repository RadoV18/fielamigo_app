import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:sizer/sizer.dart';

import '../bloc/sign_up_cubit/sign_up_cubit.dart';

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
                        const _EmailInput(),
                        const _PasswordInput(),
                        const _ConfirmPasswordInput(),
                        const _PasswordStrengthMeter(),
                        SizedBox(height: 2.5.h),
                        const _AccountTypeSelector(),
                        SizedBox(height: 2.5.h),
                        const _AccountDetails(),
                        SizedBox(height: 2.5.h),
                        const _SignUpButtons(),
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

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email.value != current.email.value,
      builder: (context, state) {
        bool displayError = context.read<SignUpCubit>().state.email.value != '';
        return TextField(
          onChanged: (email) => context.read<SignUpCubit>().setEmail(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo Electrónico',
            helperText: '',
            errorText: displayError && !context.read<SignUpCubit>().state.email.valid
              ? 'Ingrese un correo electrónico válido.'
              : null,
          )
        );
      }
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password.value != current.password.value,
      builder: (context, state) {
        bool displayError = context.read<SignUpCubit>().state.password.value != '';
        return TextField(
          onChanged: (password) => context.read<SignUpCubit>().setPassword(password),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            helperText: '',
            errorText: displayError && !context.read<SignUpCubit>().state.password.valid
              ? 'La contraseña debe contener al menos 12 caracteres.'
              : null,
          )
        );
      }
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.confirmPassword.value != current.confirmPassword.value,
      builder: (context, state) {
        bool displayError = context.read<SignUpCubit>().state.confirmPassword.value != '';
        bool isValid = context.read<SignUpCubit>().state.confirmPassword.value ==
          context.read<SignUpCubit>().state.password.value;
        return TextField(
          onChanged: (confirmPassword) => context.read<SignUpCubit>().setConfirmPassword(confirmPassword),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            helperText: '',
            errorText: displayError && !isValid
              ? 'Las contraseñas no coinciden.'
              : null
          )
        );
      }
    );
  }
}

class _PasswordStrengthMeter extends StatelessWidget {
  const _PasswordStrengthMeter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        return previous.password.value != current.password.value
        || previous.passwordStrength != current.passwordStrength;
      },
      builder: (BuildContext context, state) {
        return Column(
        children: [
          SizedBox(
            width: 100.w,
            child: const Text("Nivel de seguridad de la contraseña:", textAlign: TextAlign.left)
          ),
          const SizedBox(height: 10.0),
          FlutterPasswordStrength(
            password: state.password.value,
            height: 2.h,
            radius: 10.0,
            strengthCallback: (strength) => context.read<SignUpCubit>().setStrength(strength),
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            width: 100.w,
            child: Text(context.read<SignUpCubit>().state.passwordStrength, textAlign: TextAlign.left)
          ),
        ],
      );
      }
    );
  }
}

class _AccountTypeSelector extends StatelessWidget {
  const _AccountTypeSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState> (
      buildWhen: (previous, current) {
        bool ownerChange = previous.isOwner || current.isOwner;
        bool caregiverChange = previous.isCaregiver || current.isCaregiver;
        return ownerChange || caregiverChange;
      },
      builder: (BuildContext context, state) {
        return Column(
        children: [
          SizedBox(
            width: 100.w,
            child: const Text('Selecciona el tipo de cuenta:')
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print("tapping owner");
                  bool current = context.read<SignUpCubit>().state.isOwner;
                  if(!current) {
                    context.read<SignUpCubit>().setOwner();
                  }
                },
                child: Ink(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color.fromARGB(255, 139, 139, 139)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 5.0
                      )
                    ],
                    color: context.read<SignUpCubit>().state.isOwner
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  ),
                  child: Column(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 40.0
                        ),
                        Text('Dueño')
                      ]
                    )
                )
              ),
              GestureDetector(
                onTap: () {
                  print("tapping caregiver");
                  bool current = context.read<SignUpCubit>().state.isCaregiver;
                  if(!current) {
                    context.read<SignUpCubit>().setCaregiver();
                  }
                },
                child: Ink(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color.fromARGB(255, 139, 139, 139)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 5.0)
                    ],
                    color: context.read<SignUpCubit>().state.isCaregiver
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  ),
                  child: Column(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 40.0
                        ),
                        Text('Cuidador')
                      ]
                    )
                )
              )
          ],)
        ]
      );
      },
    );
  }
}

class _AccountDetails extends StatelessWidget {
  const _AccountDetails();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        bool owner = context.read<SignUpCubit>().state.isOwner;
        bool caregiver = context.read<SignUpCubit>().state.isCaregiver;
        String message = '';
        List<String> features = <String>[];
        if(owner) {
          message = 'Como dueño podrás:';
          features.add('Registrar a tus mascotas.');
          features.add('Contratar servicios de paseo, alojamiento, cuidado y más!');
        } else if (caregiver) {
          message = 'Como cuidador podrás:';
          features.add('Ganar dinero cuidando o paseando perros.');
          features.add('Ofrecer una combinación de servicios para perros.');
        } else {
          return Container();
        }
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.check
                    ),
                    title: Text(features[index])
                  );
                }
              )
            ]
          ),
        );
      }
    );
  }  
}

class _SignUpButtons extends StatelessWidget {
  const _SignUpButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 40, // match to the size of the parent.
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {},
            child: const Text("Crear Cuenta")
          )
        ),
        const Divider(),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {},
            child: const Text("Regístrate con Google")
          ),
        ),
        const Divider(),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {},
            child: const Text("Regístrate con Facebook")
          ),
        ),
        const SizedBox(height: 10),
      ]
    );
  }
}
