import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: grey),
        ));
  }
}

class MyHeadingText extends StatelessWidget {
  const MyHeadingText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: grey),
      ),
    );
  }
}

class MySubHeadingText extends StatelessWidget {
  const MySubHeadingText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: grey),
      ),
    );
  }
}
