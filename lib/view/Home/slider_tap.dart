import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderTap extends StatelessWidget {
  const SliderTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const SizedBox(
              width: double.maxFinite,
              child: Image(
                  image: AssetImage('images/tap1.jpg'), fit: BoxFit.fill)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const SizedBox(
              width: double.maxFinite,
              child: Image(
                  image: AssetImage('images/tap2.jpg'), fit: BoxFit.fill)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const SizedBox(
              width: double.maxFinite,
              child: Image(
                  image: AssetImage('images/tap3.jpg'), fit: BoxFit.fill)),
        ),
      ]
          .map((e) => Container(
                width: double.maxFinite,
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: e,
              ))
          .toList(),
      options: CarouselOptions(
        height: 190,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 300),
        autoPlayCurve: Curves.easeInOut,
      ),
    );
  }
}
