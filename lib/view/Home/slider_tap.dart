import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';

class SliderTap extends StatelessWidget {
  const SliderTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        Image(image: AssetImage('images/tap1.jpg'), fit: BoxFit.fill),
        Image(image: AssetImage('images/tap2.jpg'), fit: BoxFit.fill),
        Image(image: AssetImage('images/tap3.jpg'), fit: BoxFit.fill),
      ]
          .map((e) => Container(
                width: double.maxFinite,
                height: 190,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10)),
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
