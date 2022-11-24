import 'package:fielamigo_app/bloc/boarding_cubit/boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodCard extends StatefulWidget {
  final int paymentMethodId;
  final String cardNumber;
  final String cardType;
  final String expirationDate;
  final bool isSelectable;

  const PaymentMethodCard({
    super.key,
    required this.paymentMethodId,
    required this.cardNumber,
    required this.cardType,
    required this.expirationDate,
    this.isSelectable = false,
  });

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 85,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: const [
          BoxShadow(
            offset: Offset(7, 7),
            spreadRadius: -2,
            blurRadius: 7,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.credit_card,
                  size: 30,
                  color: Colors.grey,
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.cardNumber,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          widget.cardType,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Expira el ${widget.expirationDate}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            widget.isSelectable ?
            BlocBuilder<BoardingCubit, BoardingState>(
              buildWhen: (previous, current) => previous.paymentMethod != current.paymentMethod,
              builder: (context, state) => Radio(
                value: widget.paymentMethodId,
                onChanged: (value) {
                  setState(() {
                    context.read<BoardingCubit>().selectPaymentMethod(widget.paymentMethodId);
                  });
                },
                groupValue: state.paymentMethod,
              ),
            )
            : const SizedBox(),
          ],
        ),
      )
    );
  }
}