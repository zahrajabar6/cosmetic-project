import 'package:cosmetic_project/controllers/category_tap.dart';
import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/view/Home/slider_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Home',
            style: TextStyle(
                color: grey, fontSize: 26, fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SliderTap(),
            ),
            MyCategoryTap()
          ],
        ),
      ),
    );
  }
}
