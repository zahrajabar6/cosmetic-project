import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/view/splashpages/mysplash.dart';
import 'package:cosmetic_project/view/onboarding%20screens/welcome_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeOne extends StatelessWidget {
  const WelcomeOne({Key? key}) : super(key: key);

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
                image_link: 'images/Layer 0.png',
                title: 'Eco-friendly',
                text:
                    'The product development process is structured in a way that considers the impacts that can be caused to the environment throughout their life cycle.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, bottom: 70, left: 5, right: 5),
                  width: 12,
                  height: 12,
                  decoration:
                      BoxDecoration(color: green, shape: BoxShape.circle),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, bottom: 70, left: 5, right: 5),
                  width: 12,
                  height: 12,
                  decoration:
                      BoxDecoration(color: light_green, shape: BoxShape.circle),
                ),
              ],
            ),
            MyButton(
              text: 'Next',
              onPress: () {
                Get.to(const WelcomeTwo());
              },
            )
          ],
        ),
      ),
    );
  }
}
