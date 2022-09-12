import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.myController,
    required this.typed,
    required this.hint,
  }) : super(key: key);

  final TextEditingController myController;
  final RxString typed;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: myController,
        onChanged: (x) {
          typed.value = x;
        },
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: grey.withOpacity(0.20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: green),
          ),
          suffixIcon: TextButton(
            child: Obx(() {
              return Icon(
                Icons.search_rounded,
                color: typed.isEmpty ? grey : green,
                size: 30,
              );
            }),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
