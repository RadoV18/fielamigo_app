import 'package:flutter/material.dart';

class CaregiverExperience extends StatelessWidget {
  const CaregiverExperience({super.key});

  static final List<String> entries = <String>['Experiencia con perros', 'Experiencia con gatos', 'Voluntario en albergues de animales', 'Educador canino profesional', 'Paseador de perros', 'Cuidador de perros'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Experiencia",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  const Icon(Icons.check, size: 15),
                  const SizedBox(width: 10),
                  Text(
                    entries[index],
                    style: const TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              );
            }
          ) 
        )
      ]
    );
  }
}