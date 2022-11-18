import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/pet_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onBackButtonPressed: () => Navigator.pop(context),
          title: 'Información de mascota',
        ),
        body: BlocBuilder<AddPetCubit, AddPetState>(
          builder: (context, state) {
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.h),
                                  child: Image.network(
                                      "https://www.elmueble.com/medio/2022/09/05/perro-cachorro_82dd9cd3_900x900.jpg"),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                "Fido"),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                "1 año"),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                "Golden"),
                            const SizedBox(
                              height: 20,
                            ),
                            const PetDescription(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {},
                                ),
                                const Text("Esterilizado"),
                              ],
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10),
                                helperText: 'Notas del dueño',
                                hintText: 'Fido es inquieto al salir de casa',
                                isDense: true,
                                hintStyle: TextStyle(
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
        ));
  }
}
