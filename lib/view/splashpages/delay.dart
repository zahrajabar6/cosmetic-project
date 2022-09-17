import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

startTime(Widget page) async {
  var duration = const Duration(seconds: 5);
  return Timer(duration, route(page));
}

route(Widget page) {
  Get.to(page);
}
