
import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    Key? key,
    required this.myController,
    required this.typed,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  final TextEditingController myController;
  final RxString typed;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: myController,
        onChanged: (x) {
          typed.value = x;
        },
        onSubmitted: (x){
          FocusScope.of(context).unfocus();
        },
        enableSuggestions: false,
        autocorrect: false,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: grey.withOpacity(0.20)),
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
                icon,
                color: typed.isEmpty ? grey.withOpacity(0.70) : green,
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
