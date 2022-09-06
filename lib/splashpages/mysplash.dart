import 'package:cosmetic_project/colors.dart';
import 'package:flutter/material.dart';

class MySplash extends StatelessWidget {
  const MySplash(
      {Key? key,
      required this.title,
      required this.text,
      required this.image_link})
      : super(key: key);

  final String title;
  final String text;
  final String image_link;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            image_link,
          ),
          width: 272,
          height: 272,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: grey.withOpacity(0.70)),
          ),
        ),
      ],
    );
  }
}
