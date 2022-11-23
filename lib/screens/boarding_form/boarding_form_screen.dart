import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_date_range.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_description.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_location.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_pets.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BoardingFormScreen extends StatelessWidget {
  const BoardingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Alojamiento para perros',
      ),
      body: SingleChildScrollView(
        child:
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                const BoardingDescription(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingDateRange(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingLocation(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingPets(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/search-results'),
                  child: const Text('Buscar alojamiento'),
                ),
              ],
            ),
          )
      ),
    );
  }
}
