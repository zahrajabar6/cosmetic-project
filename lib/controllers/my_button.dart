import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  final String text;
  //final Widget page;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Container(
          height: 47,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: green),
          child: Center(
            child: Obx((){
                return  !AuthService.isBusy.value ? Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: light_green),
                ) : const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
            }),
          ),
        ));
  }
}
