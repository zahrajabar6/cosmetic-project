import 'package:cosmetic_project/Home/home.dart';
import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/my_button.dart';
import 'package:cosmetic_project/splashpages/logopage.dart';
import 'package:cosmetic_project/splashpages/mysplash.dart';
import 'package:cosmetic_project/splashpages/welcome_one.dart';
import 'package:flutter/material.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MySplash(
                image_link: 'images/Layer 1.png',
                title: 'Vegan and Crulety-free',
                text:
                    '''Our products does not contain any animal or animal-derived ingredients.
Finished product and ingredients are not tested on animals. '''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 2; i++)
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30, bottom: 70, left: 5, right: 5),
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: green, shape: BoxShape.circle),
                  ),
              ],
            ),
            MyButton(
              text: 'Get Started',
              page: MyHomePage(),
            )
          ],
        ),
      ),
    );
  }
}
