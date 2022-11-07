import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String cardNumber;
  final String cardType;
  final String expirationDate;

  const PaymentMethodCard({
    super.key,
    required this.cardNumber,
    required this.cardType,
    required this.expirationDate,
  });

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
      child: Row(
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
                cardNumber,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    cardType,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Expira el $expirationDate",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      )
    );
  }
}