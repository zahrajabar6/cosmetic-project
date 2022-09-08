import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/splashpages/logopage.dart';
import 'package:cosmetic_project/splashpages/welcome_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pure Beauty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato'),
      home: const MyLogoPage(),
    );
  }
}
