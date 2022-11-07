import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/payment_method_card.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Métodos de Pago',
        
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      PaymentMethodCard(
                        cardNumber: '**** **** **** 1234',
                        cardType: 'Visa',
                        expirationDate: '12/22',
                      ),
                      SizedBox(height: 20),
                      PaymentMethodCard(
                        cardNumber: '**** **** **** 1234',
                        cardType: 'Visa',
                        expirationDate: '12/22',
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/payment_methods/add'),
                    child: const Text('Agregar Método de Pago'),
                  ),
                ]
              ),
            ),
          )
        ],
      )
    );
  }
}