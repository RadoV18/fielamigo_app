import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PictureCarousel extends StatelessWidget {
  const PictureCarousel({super.key});

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
      items: [
        'https://picsum.photos/seed/1/400/300',
        'https://picsum.photos/seed/2/400/300',
        'https://picsum.photos/seed/3/400/300',
        'https://picsum.photos/seed/4/400/300'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
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