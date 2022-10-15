import 'package:fielamigo_app/screens/user_form_screen/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/user_data_cubit/user_data_cubit.dart';
import 'widgets/address_form.dart';
import '../sign_up/widgets/header.dart';
import '../sign_up/widgets/user_data_form.dart';

/*

  deprecated

*/

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      buildWhen: ((previous, current) => previous != current),
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView (
          child: Container(
            padding: EdgeInsets.fromLTRB(
              5.w, 7.5.h, 5.w, MediaQuery.of(context).viewInsets.bottom),
            child: Column (
              children: [
                SizedBox(height: 5.h),
                const Header(),
                SizedBox(height: 5.h),
                const UserDataForm(),
                SizedBox(height: 5.h),
                const AddressForm(),
                SizedBox(height: 5.h),
                const SubmitButton(),
                SizedBox(height: 5.h),
              ]
            )
          ),
        )
      ),
    );
  }
}