import 'package:flutter/material.dart';

class CaregiverExperience extends StatelessWidget {
  final String firstName;
  final List<String>? experience;

  const CaregiverExperience({
    super.key,
    required this.firstName,
    this.experience,
  });

  static final List<String> entries = <String>['Experiencia con perros', 'Experiencia con gatos', 'Voluntario en albergues de animales', 'Educador canino profesional', 'Paseador de perros', 'Cuidador de perros'];

  @override
  Widget build(BuildContext context) {
    if(experience == null || experience!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Experiencia de $firstName",
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experience!.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  const Icon(Icons.check, size: 15),
                  const SizedBox(width: 10),
                  Text(
                    experience![index],
                    style: const TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ) 
        )
      ]
    );
  }
}