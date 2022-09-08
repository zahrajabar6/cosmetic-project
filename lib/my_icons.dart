import 'package:cosmetic_project/colors.dart';
import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  const MyIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: green, size: 30);
  }
}
