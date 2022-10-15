import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({ super.key });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 40, // match to the size of the parent.
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {
              // TODO send request
              context.read<SignUpCubit>().submit();
              Navigator.pushNamed(context, "/verification-code");
            },
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