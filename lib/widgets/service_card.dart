import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceCard extends StatelessWidget {
  final SvgPicture? icon;
  final String? title;
  final String? subtitle;
  final double? price;
  final String? priceDetails;

  const ServiceCard({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.price,
    this.priceDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 85,
      padding: const EdgeInsets.all(10.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 4.0,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Color(0xff047b5b),
                      width: 2.0,
                    ),
                  ),
                  child: ClipRRect(
                    child: icon,
                  )
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bs.${price!.toStringAsPrecision(2)}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                priceDetails!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}