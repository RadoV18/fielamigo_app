// TODO: move to new screen
// TODO: change to new cubit (user_data_cubit)

// import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';

// class UserDataForm extends StatefulWidget {
//   const UserDataForm({super.key});

//   @override
//   State<UserDataForm> createState() => _UserDataFormState();
// }

// class _UserDataFormState extends State<UserDataForm> {
//   TextEditingController dateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // on date change update the state
//     context.read<SignUpCubit>().setBirthDate(dateController.text);

//     // change the date format to dd/mm/yyyy
//     if(dateController.text != '') {
//       int year = int.parse(dateController.text.substring(0, 4));
//       int month = int.parse(dateController.text.substring(5, 7));
//       int day = int.parse(dateController.text.substring(8, 10));
//       String dateValue = '$day/$month/$year';
//       dateController.text = dateValue;
//     }   

//     return SizedBox(
//       height: 40.h,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Ingresa tus datos personales:",
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.bold
//               )
//             ),
//           ),
//           TextFormField(
//             onChanged: (value) {
//               context.read<SignUpCubit>().setFirstName(value);
//             },
//             decoration: const InputDecoration(
//               labelText: "Nombre"
//             )
//           ),
//           TextFormField(
//             onChanged: (value) {
//               context.read<SignUpCubit>().setLastName(value);
//             },
//             decoration: const InputDecoration(
//               labelText: "Apellido"
//             )
//           ),
//           TextFormField(
//             onChanged: (value) {
//               context.read<SignUpCubit>().setPhoneNumber(value);
//             },
//             decoration: const InputDecoration(
//               labelText: "Teléfono"
//             )
//           ),
//           Row(
//             children: [
//               const Text("Fecha de Nacimiento:"),
//               SizedBox(width: 5.w),
//               Expanded (
//                 child: TextFormField(
//                   controller: dateController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.calendar_today),
//                     hintText: "dd / mm / aaaa"
//                   ),
//                   readOnly: true,
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now()
//                     );
                    
//                     if (pickedDate != null) {
//                       setState(() {
//                         // rebuild the widget to update the date on bloc
//                         dateController.text = pickedDate.toIso8601String();  
//                       });
//                     }
//                   }
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }