import 'package:cosmetic_project/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hint,
    required this.myController,
  }) : super(key: key);

  final String hint;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.maxFinite,
        height: 47,
        child: TextField(
          controller: myController,
          onChanged: (x) {
            print(x);
          },
          autofocus: false,
          style:
              TextStyle(fontSize: 20, color: grey, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 20,
                color: grey.withOpacity(0.60),
                fontWeight: FontWeight.normal),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: grey.withOpacity(0.20)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: green.withOpacity(0.60)),
            ),
          ),
        ),
      ),
    );
  }
}
/* Widget _mytextfield(String hint, TextEditingController myController) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: SizedBox(
      width: double.maxFinite,
      height: 47,
      child: TextField(
        controller: myController,
        onChanged: (x) {
          print(x);
        },
        autofocus: false,
        style:
            TextStyle(fontSize: 20, color: grey, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 20,
              color: grey.withOpacity(0.60),
              fontWeight: FontWeight.normal),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: grey.withOpacity(0.20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: green.withOpacity(0.60)),
          ),
        ),
      ),
    ),
  );
} */