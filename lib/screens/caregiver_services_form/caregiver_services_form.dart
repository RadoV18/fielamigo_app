import 'dart:developer';

import 'package:fielamigo_app/bloc/caregiver_services_form_cubit/caregiver_services_form_cubit.dart';
import 'package:fielamigo_app/bloc/caregiver_services_form_cubit/caregiver_services_form_state.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/boarding_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/nursing_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/training_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/walking_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/widgets/card.dart';
import 'package:fielamigo_app/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareGiverServicesFormScreen extends StatelessWidget {
  const CareGiverServicesFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top+20,
            bottom: MediaQuery.of(context).padding.bottom),
        child: Center(
          child: Column(
            children: [
              const Text(
                "¿Qué servicios ofreces?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              const Text("Selecciona al menos 1 servicio."),
              const SizedBox(height: 30,),
              BlocBuilder<CaregiverServicesFormCubit, CaregiverServiesFormState>(
                builder: (context, state) => 
                CardFb1(
                  text: "Alojamiento",
                  iconPath: "assets/icons/ic_home_access_pet_parent.svg",
                  subtitle:
                      "Si decides alojar, debes cuidar de los perros en tu casa.",
                  isAlreadyCompleted: state.hasBoardingConfiguration ? true : false,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BoardingForm())),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<CaregiverServicesFormCubit, CaregiverServiesFormState>(
                builder: (context, state) => 
                CardFb1(
                  text: "Paseo",
                  iconPath: "assets/icons/ic_dog_for_walk.svg",
                  subtitle:
                      "Si decides pasear, debes llevar a los perros a pasear por las areas que tu designas.",
                  isAlreadyCompleted: state.hasWalkingConfiguration ? true : false,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> WalkingForm())),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<CaregiverServicesFormCubit, CaregiverServiesFormState>(
                builder: (context, state) =>
                CardFb1(
                  text: "Entrenamiento",
                  iconPath: "assets/icons/ic_service_training_placeholder.svg",
                  subtitle:
                      "Si decides entrenar, puedes ofrecer clases de entrenamiento a domicilio o en tu casa.",
                  isAlreadyCompleted: state.hasTrainingConfiguration ? true : false,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TrainingForm())),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<CaregiverServicesFormCubit, CaregiverServiesFormState>(
                builder: (context, state) => 
                CardFb1(
                  text: "Cuidado",
                  iconPath: "assets/icons/ic_drop_in_service_tile.svg",
                  subtitle:
                      "Si decides cuidar, puedes ofrecer el servicio en tu casa o a domicilio.",
                  isAlreadyCompleted: state.hasNursingConfiguration ? true : false,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NursingForm())),
                ),
              ),
              const SizedBox(height: 50,),
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primary,
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  right: 75, left: 75, top: 15, bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Siguiente",
                        style:TextStyle(color: Color(0xffffffff), fontSize: 16),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
