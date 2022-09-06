import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/splashpages/delay.dart';
import 'package:flutter/material.dart';

class MyLogoPage extends StatefulWidget {
  const MyLogoPage({Key? key}) : super(key: key);

  @override
  State<MyLogoPage> createState() => _MyLogoPageState();
}

class _MyLogoPageState extends State<MyLogoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/logo.png',
                width: 240,
                height: 240,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Pure Beauty',
                style: TextStyle(color: grey, fontSize: 60, fontFamily: 'Ole'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
