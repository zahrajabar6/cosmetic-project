import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/services/auth/localdb.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/onboarding%20screens/welcome_one.dart';
import 'package:cosmetic_project/view/onboarding%20screens/welcome_two.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(controller: controller, children: [
          WelcomeOne(onPress: () {
            controller.nextPage(
                duration: const Duration(microseconds: 300),
                curve: Curves.easeInOut);
          }),
          WelcomeTwo(
            onPress: () async {
              DB.prefs = await SharedPreferences.getInstance();
              DB.prefs.setBool('showLogin', true);
              Get.to(const MyLogin());
            },
          )
        ]),
      ),
      bottomSheet: Container(
        color: background_color,
        height: 80,
        child: Center(
            child: SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: WormEffect(
              spacing: 15,
              dotColor: Colors.black26,
              activeDotColor: green,
              dotHeight: 10,
              dotWidth: 10),
        )),
      ),
    );
  }
}
