import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PictureCarousel extends StatelessWidget {
  final List<String> images;

  const PictureCarousel({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Color(0xffe6e6e6)
              ),
              child: Image.network(i, fit: BoxFit.contain),
            );
          },
        );
      }).toList(),
    );
  }
}