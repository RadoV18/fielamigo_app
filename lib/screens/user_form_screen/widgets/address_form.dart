// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';

// import '../../../bloc/user_data_cubit/user_data_cubit.dart';

// class AddressForm extends StatelessWidget {
//   const AddressForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // data from bloc
//     // String country = context.read<UserDataCubit>().state.country;
//     // String city = context.read<UserDataCubit>().state.city;
//     // // string to show in the dropdown
//     // String? countryValue = country == '' ? null : country;
//     // String? cityValue = city == '' ? null : city;

//     return BlocBuilder<UserDataCubit, UserDataState> (
//       buildWhen: (previous, current) => previous.country != current.country
//                                           || previous.city != current.city,
//       builder: (context, state) => SizedBox(
//         height: 40.h,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Ingresa tu dirección:",
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.bold
//                 )
//               ),
//             ),
//             TextFormField(
//               onChanged: (value) {
//                 context.read<UserDataCubit>().setAddress1(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: "Calle"
//               )
//             ),
//             TextFormField(
//               onChanged: (value) {
//                 context.read<UserDataCubit>().setAddress2(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: "Dpto., edificio, piso, etc."
//               )
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: DropdownButton(
//                     value: countryValue,
//                     isExpanded: true,
//                     hint: const Text("País"),
//                     // TODO: from http request
//                     items: const ['abc', 'def', 'ghi']
//                       .map((e) => DropdownMenuItem(
//                         value: e,
//                         child: Text(e)
//                       ))
//                       .toList(),
//                     onChanged: (value) {
//                       print("new value $value");
//                       context.read<UserDataCubit>().setCountry(value ?? '');
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 5.w),
//                 Expanded(
//                   child: DropdownButton(
//                     isExpanded: true,
//                     hint: const Text("Ciudad"),
//                     // TODO: from http request
//                     items: const ['abc', 'def', 'ghi']
//                       .map((e) => DropdownMenuItem(
//                         value: e,
//                         child: Text(e)
//                       ))
//                       .toList(),
//                     onChanged: (value) {
//                       context.read<UserDataCubit>().setCity(value ?? '');
//                     },
//                     value: cityValue,
//                   ),
//                 )
//               ],
//             )
//           ]
//         )
//       ),
//     );
//   }
// }