import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_icons.dart';
import 'package:flutter/material.dart';

class FilteringButton extends StatelessWidget {
  const FilteringButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: light_green),
      child: const Center(child: MyIcons(icon: Icons.filter_list_outlined)),
    );
  }
}
