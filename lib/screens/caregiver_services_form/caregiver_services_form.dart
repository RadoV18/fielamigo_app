import 'dart:developer';

import 'package:fielamigo_app/screens/caregiver_services_form/boarding_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/widgets/card.dart';
import 'package:fielamigo_app/utils/global_theme.dart';
import 'package:flutter/material.dart';

class CareGiverServicesFormScreen extends StatelessWidget {
  const CareGiverServicesFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
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
              const SizedBox(height: 30,),
              CardFb1(
                text: "Alojamiento",
                iconPath: "assets/icons/ic_home_access_pet_parent.svg",
                subtitle:
                    "Si decides alojar, pos MODO SEXO 1",
                isAlreadyCompleted: true,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BoardingForm())),
              ),
              const SizedBox(
                height: 15,
              ),
              CardFb1(
                text: "Paseo",
                iconPath: "assets/icons/ic_dog_for_walk.svg",
                subtitle:
                    "Si decides pasear, pos MODO SEXO 2",
                isAlreadyCompleted: true,
                onPressed: () => log("Paseo"),
              ),
              const SizedBox(
                height: 15,
              ),
              CardFb1(
                text: "Entrenamiento",
                iconPath: "assets/icons/ic_service_training_placeholder.svg",
                subtitle:
                    "Si decides entrenar, pos MODO SEXO 3",
                isAlreadyCompleted: true,
                onPressed: () => log("Entrenamiento"),
              ),
              const SizedBox(
                height: 15,
              ),
              CardFb1(
                text: "Cuidado",
                iconPath: "assets/icons/ic_drop_in_service_tile.svg",
                subtitle:
                    "Si decides cuidar, pos MODO SEXO 4",
                isAlreadyCompleted: true,
                onPressed: () => log("Cuidado"),
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
