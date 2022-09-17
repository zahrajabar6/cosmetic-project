import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/view/splashpages/delay.dart';
import 'package:flutter/material.dart';

class MyLogoPage extends StatefulWidget {
  const MyLogoPage({Key? key, required this.page}) : super(key: key);
  final Widget page;

  @override
  State<MyLogoPage> createState() => _MyLogoPageState();
}

class _MyLogoPageState extends State<MyLogoPage> {
  @override
  void initState() {
    // ignore: todo
    //TODO: implement initState
    super.initState();
    startTime(widget.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 240,
                height: 240,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'Pure Beauty',
                  style:
                      TextStyle(color: grey, fontSize: 60, fontFamily: 'Ole'),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: green,
                  strokeWidth: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
