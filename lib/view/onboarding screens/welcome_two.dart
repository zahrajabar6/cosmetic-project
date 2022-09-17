import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/view/onboarding%20screens/mysplash.dart';
import 'package:flutter/material.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({Key? key, required this.onPress}) : super(key: key);
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
                image_link: 'images/Layer 1.png',
                title: 'Vegan and Crulety-free',
                text:
                    '''Our products does not contain any animal or animal-derived ingredients.
Finished product and ingredients are not tested on animals. '''),
          ),
          MyButton(text: 'Get Started', onPress: onPress)
        ],
      ),
    );
  }
}
