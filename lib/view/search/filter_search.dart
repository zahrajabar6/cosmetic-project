import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';

class MySearchFilter extends StatelessWidget {
  const MySearchFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Product.categories
            .map((e) => Container(
                  height: 150,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: grey.withOpacity(0.10))),
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(
                          fontSize: 40,
                          color: green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
            .toList());
  }
}
