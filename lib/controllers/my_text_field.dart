import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,

    required this.hint,
    required this.icon,
  }) : super(key: key);


  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: grey, fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: grey.withOpacity(0.20)),
          ),

          suffixIcon: Icon(
            icon,
            color: grey.withOpacity(0.70),
            size: 30,
          ),

        ),
      ),
    );
  }
}