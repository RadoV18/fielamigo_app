import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

import '../bloc/sign_up_cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        body: Column(children: const [
          // _Header(),
          _EmailInput(),
          _PasswordInput(),
          _ConfirmPasswordInput(),
          _PasswordStrengthMeter(),
          // sign up button
        ]),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => TextField(
        onChanged: (email) => context.read<SignUpCubit>().setEmail(email),
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Correo Electrónico',
          helperText: '',
          errorText: null,
        )
      )
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => TextField(
        onChanged: (password) => context.read<SignUpCubit>().setPassword(password),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          helperText: '',
          errorText: null,
        )
      )
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => TextField(
        onChanged: (confirmPassword) => context.read<SignUpCubit>().setConfirmPassword(confirmPassword),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'Confirmar contraseña',
          helperText: '',
          errorText: null
        )
      )
    );
  }
}

class _PasswordStrengthMeter extends StatelessWidget {
  const _PasswordStrengthMeter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (BuildContext context, state) => FlutterPasswordStrength(
        password: state.password.value,
        strengthCallback: (strength) {
          print(strength.toString());
        }
      )
    );
  }
}
