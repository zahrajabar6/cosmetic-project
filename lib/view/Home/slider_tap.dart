import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderTap extends StatelessWidget {
  const SliderTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CarouselSlider(
        items: const [
          Image(image: AssetImage('images/tap1.jpg'), fit: BoxFit.fill),
          Image(image: AssetImage('images/tap2.jpg'), fit: BoxFit.fill),
          Image(image: AssetImage('images/tap3.jpg'), fit: BoxFit.fill),
        ]
            .map((e) => Container(
                  width: double.maxFinite,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
      ),
    );
  }
}
