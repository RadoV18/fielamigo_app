import 'package:fielamigo_app/bloc/payment_methods_cubit/payment_methods_cubit.dart';
import 'package:fielamigo_app/utils/ui_utils.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add_payment_method_cubit/add_payment_method_cubit.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  AddPaymentMethodScreen({Key? key}) : super(key: key);

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
                  //blocbuilder
                  BlocConsumer<AddPaymentMethodCubit, AddPaymentMethodState>(
                    listener: (context, state) {
                      if (state == const AddPaymentMethodLoading()) {
                        // return const Center(
                        //   child: CircularProgressIndicator(),
                        // );
                        UiUtils.showAlertDialog(context,
                            message: "Cargando...",
                            isDismissible: false,
                            hasCircularProgressIndicator: true); // loading
                      } else if (state is AddPaymentMethodSuccess) {
                        // return const Center(
                        //   child: Text("Tarjeta agregada con éxito"),
                        // );
                        Navigator.pop(context, true);
                        UiUtils.showAlertDialog(
                          context,
                          message: "Success",
                          isDismissible: true,
                        );
                      } else if (state is AddPaymentMethodError) {
                        // return const Center(
                        //   child: Text("Error al agregar tarjeta"),
                        // );
                        Navigator.pop(context, true);
                        UiUtils.showAlertDialog(context,
                            message: "Error", isDismissible: false);
                      }
                    },
                    builder: (context, state) {
                      return PaymentMethodForm(
                          _cardNumberController,
                          _cardHolderController,
                          _expirationDateController,
                          _cvvController);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<AddPaymentMethodCubit>().addCard(
                      _cardNumberController.text,
                      _cardHolderController.text,
                      _expirationDateController.text,
                      _cvvController.text);
                  await context.read<PaymentMethodsCubit>().init();
                  Navigator.pop(context); //forces payment methods screen to refresh
                },
                child: const Text('Guardar'),
              ),
            ]),
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

Widget PaymentMethodForm(
    TextEditingController cardNumberController,
    TextEditingController cardHolderController,
    TextEditingController expirationDateController,
    TextEditingController cvvController) {
  return Column(
    children: [
      TextField(
        controller: cardNumberController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Número de tarjeta',
          hintText: '**** **** **** ****',
        ),
        // TODO: change to cubit
        onChanged: (value) => print(value),
      ),
      TextField(
        controller: cardHolderController,
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
              controller: expirationDateController,
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
              controller: cvvController,
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
  );
}
