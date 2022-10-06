import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/sign_up_cubit/sign_up_cubit.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({ super.key });

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