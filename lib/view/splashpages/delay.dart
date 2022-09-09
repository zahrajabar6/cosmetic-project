import 'dart:async';
import 'package:cosmetic_project/view/splashpages/welcome_one.dart';
import 'package:get/get.dart';

startTime() async {
  var duration = const Duration(seconds: 5);
  return Timer(duration, route);
}

route() {
  Get.to(const WelcomeOne());
}
