import 'dart:async';

import 'package:cosmetic_project/splashpages/welcome_one.dart';
import 'package:get/get.dart';

startTime() async {
  var duration = new Duration(seconds: 10);
  return new Timer(duration, route);
}

route() {
  Get.to(WelcomeOne());
}
