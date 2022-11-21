import 'package:flutter/material.dart';

import 'about_me.dart';
import 'caregiver_experience.dart';
import 'caregiver_pets.dart';
import 'picture_carousel.dart';

class CaregiverProfile extends StatelessWidget {
  const CaregiverProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: const [
            AboutMe(
              firstName: "Juan",
              text: "Me llamo Juan y me gustan tanto los animales que soy educador canino profesional, paseador y cuidador de perros. Además, soy voluntario en el centro de acogida de animales de compañía La Paz paseando a perros y mimando a gatos.\n\nNuestra familia peluda se compone de un perro y un gato, y anteriormente he tenido más perros. A mi mujer también le encantan todos los animales, así que vuestros peludos estarán siempre muy bien cuidados."
            ),
            SizedBox(height: 20),
            PictureCarousel(),
            SizedBox(height: 20,),
            CaregiverPets(
              firstName: "Juan",
            ),
            SizedBox(height: 20,),
            CaregiverExperience(),
            SizedBox(height: 20,)
          ]
        ),
      ),
    );
  }
}
