import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  final String firstName;
  final String text;
  
  const AboutMe({
    super.key,
    required this.firstName,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sobre $firstName',
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 16
          ),
        )
      ],
    );
  }
}
