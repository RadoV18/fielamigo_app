import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_owner.dart';

class OwnerAddPetScreen extends StatelessWidget {
  const OwnerAddPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text("Agregar Mascota"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Introduce los datos de tu perro:"),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Nombre",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Raza",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Edad",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Tamaño",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Foto",
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
            // Save button
            ElevatedButton(
              onPressed: () {
                // TODO: request to add pet
              },
              child: const Text("Agregar"),
            ),
          ],
        )
      ),
      bottomNavigationBar: const BottomNavigationBarOwner(
        isPetsSelected: true
      ),
    );
  }
}