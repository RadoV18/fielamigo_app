import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../bloc/page_status.dart';
import '../../bloc/payment_methods_cubit/payment_methods_cubit.dart';
import '../../utils/ui_utils.dart';
import '../../widgets/payment_method_card.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Métodos de Pago',
      ),
      body: BlocConsumer<BoardingCubit, BoardingState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == PageStatus.finished) {
            // go to confirmation page
            Navigator.pushNamed(context, '/boarding-confirmation');
          } else if (state.status == PageStatus.submitting) {
            // show loading
            UiUtils.showAlertDialog(
              context,
              message: "Cargando...",
              isDismissible: false,
              hasCircularProgressIndicator: true,
            );
          } else if (state.status == PageStatus.error) {
            // show error
            UiUtils.showAlertDialog(
              context,
              message: "Error al realizar la reserva.",
              isDismissible: true,
            );
          }
        },
        builder: (context, state) => CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
                          builder: (context, state) {
                            if(state is PaymentMethodsLoading){
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is PaymentMethodsLoaded) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                // shrinkWrap: true,
                                itemCount: state.paymentMethods!.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PaymentMethodCard(
                                    paymentMethodId: state.paymentMethods![index].paymentMethodId,
                                    cardNumber: '**** **** **** ${state.paymentMethods![index].lastDigits}',
                                    cardType: 'Visa',
                                    expirationDate: state.paymentMethods![index].getExpirationDate(),
                                    isSelectable: true
                                  ),
                                ),
                                
                              );
                            } else if (state is PaymentMethodsError) {
                              return Center(
                                child: Text(state.errorMessage!),
                              );
                            } else {
                              return const Center(
                                child: Text('Error'),
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (() => Navigator.pushNamed(context, '/payment-methods/add')),
                              child: Container(
                                height: 6.h,
                                width: 80.w,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Color(0xFF3a5080),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(4, 8),
                                      spreadRadius: -2,
                                      blurRadius: 7,
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Agregar método de pago',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (() => context.read<BoardingCubit>().confirm()),
                              child: Container(
                                height: 6.h,
                                width: 80.w,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Color(0xFF3a5080),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(4, 8),
                                      spreadRadius: -2,
                                      blurRadius: 7,
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Solicitar Reserva',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
                
              ),
            ],
          ),
      ),
    );
  }
}