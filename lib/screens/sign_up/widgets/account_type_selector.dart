import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/sign_up_cubit/sign_up_cubit.dart';

class AccountTypeSelector extends StatelessWidget {
  
  const AccountTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen:(previous, current) {
        return (previous.isCaregiver != current.isCaregiver)
          || (previous.isOwner != current.isOwner);
      },
      builder: (ctx, state) {
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
                AccountType(
                  icon: Icons.person,
                  onTap: () { 
                    bool current = ctx.read<SignUpCubit>().state.isOwner;
                    if(!current) {
                      ctx.read<SignUpCubit>().setOwner();
                    }
                  },
                  isSelected: ctx.read<SignUpCubit>().state.isOwner,
                  text: 'Dueño'
                ),
                AccountType(
                  icon: Icons.person,
                  onTap: () {
                    bool current = ctx.read<SignUpCubit>().state.isCaregiver;
                    if(!current) {
                      ctx.read<SignUpCubit>().setCaregiver();
                    }
                  },
                  isSelected: ctx.read<SignUpCubit>().state.isCaregiver,
                  text: 'Cuidador'
                ),
            ],)
          ]
        );
      },
    );
  }
}

class AccountType extends StatelessWidget {

  final Function()? onTap;
  final bool isSelected;
  final String text;
  final IconData? icon;

  const AccountType({
    super.key,
    required this.onTap,
    this.isSelected = false,
    required this.text,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          color: isSelected
            ? const Color(0xff047b5b)
            : Colors.white,
        ),
        child: Column(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: isSelected ? Colors.white : Colors.black,
              ),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14.0,
                ),
              )
            ]
          )
      )
    );
  }
}