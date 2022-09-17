import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.search, size: 100, color: grey.withOpacity(0.10)),
        Text(
          'Type to Search',
          style: TextStyle(fontSize: 30, color: grey.withOpacity(0.10)),
        )
      ],
    );
  }
}
