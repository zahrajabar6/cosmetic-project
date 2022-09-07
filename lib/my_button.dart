import 'package:cosmetic_project/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text, required this.page})
      : super(key: key);

  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.to(page);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          height: 47,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: green),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: light_green),
          ),
        ));
  }
}
