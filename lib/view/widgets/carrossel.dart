import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImages extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/conteudo1.png',
    'assets/conteudo2.png',
    'assets/conteudo3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(url, fit: BoxFit.cover, width: double.infinity);
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 350,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
      ),
    );
  }
}