import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/view/onboarding%20screens/mysplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeOne extends StatelessWidget {
  const WelcomeOne({Key? key, required this.onPress}) : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: MySplash(
                image_link: 'images/Layer 0.png',
                title: 'Eco-friendly',
                text:
                    'The product development process is structured in a way that considers the impacts that can be caused to the environment throughout their life cycle.'),
          ),
          MyButton(isLoading: false.obs,text: 'Next', onPress: onPress)
        ],
      ),
    );
  }
}
