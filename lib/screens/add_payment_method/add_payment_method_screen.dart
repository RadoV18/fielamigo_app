import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Agregar Tarjeta',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Número de tarjeta',
                    hintText: '**** **** **** ****',
                  ),
                  // TODO: change to cubit
                  onChanged: (value) => print(value),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre en la tarjeta',
                  ),
                  onChanged: (value) => print(value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Fecha de expiración',
                          hintText: 'mm/aa',
                        ),
                        onChanged: (value) => print(value),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                          hintText: '***',
                        ),
                        onChanged: (value) => print(value),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              // TODO: change to cubit
              onPressed: () => Navigator.pushNamed(context, '/payment_methods/add'),
              child: const Text('Guardar'),
            ),
          ]
        ),
      ),
      
      // CustomScrollView(
      //   slivers: [
      //     SliverFillRemaining(
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      //         child: 
      //       ),
      //     )
      //   ],
      // )
    );
  }
}