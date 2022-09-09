import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchField extends StatefulWidget {
  const MySearchField({
    Key? key,
    //required this.hint,
    //required this.myController,
  }) : super(key: key);

  //final String hint;
  //final TextEditingController myController;

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  RxString typed = ''.obs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: TextField(
        //controller: widget.myController,
        onChanged: (x) {
          typed.value = x;
        },
        autofocus: false,
        style:
            TextStyle(fontSize: 20, color: grey, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search..',
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
    );
  }
}
