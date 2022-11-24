import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/pet_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../bloc/get_dog_cubit/get_dog_cubit.dart';
import '../bloc/page_status.dart';

class PetInfo extends StatelessWidget {
  final int? dogId;

  const PetInfo({
    super.key,
    this.dogId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onBackButtonPressed: () => Navigator.pop(context),
          title: 'Información de mascota',
        ),
        body: BlocProvider<GetDogCubit>(
          create:(context) => GetDogCubit()..init(dogId!),
          child: BlocConsumer<GetDogCubit, GetDogState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              
            },
            builder: (context, state) {
              if(state.status == PageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              int age = DateTime.now().difference(state.birthDate!).inDays ~/ 365;
              return SafeArea(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff047b5b), width: 3),
                                    borderRadius: BorderRadius.circular(30.h),
                                  ),
                                  width: 35.h,
                                  height: 35.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35.h),
                                    child: state.imageUrl != null ?
                                      Image.network(
                                        state.imageUrl!
                                      )
                                      : Icon(
                                        Icons.pets,
                                        size: 25.h,
                                        color: const Color(0xff047b5b),
                                      ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                state.name!),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                "$age ${age == 1 ? "año" : "años"}"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  state.breed!),
                              const SizedBox(
                                height: 20,
                              ),
                              PetDescription(
                                isMale: state.isMale!,
                                size: state.size!
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: state.isSterilized,
                                    onChanged: (bool? value) {},
                                  ),
                                  const Text("Esterilizado"),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.all(10),
                                  helperText: 'Notas del dueño',
                                  hintText: state.notes,
                                  isDense: true,
                                  hintStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  isCollapsed: false,
                                ),
                                maxLines: 5,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
