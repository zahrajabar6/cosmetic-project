import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/product_tap.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCategoryTap extends StatefulWidget {
  const MyCategoryTap({Key? key}) : super(key: key);

  @override
  State<MyCategoryTap> createState() => _MyCategoryTapState();
}

class _MyCategoryTapState extends State<MyCategoryTap> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: Product.categories
              .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: MySubHeadingText(text: e)),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: Product.products
                                  .where((p) => p.category == e)
                                  .map(
                                      (element) => ProductTap(product: element))
                                  .toList()),
                        )
                      ])))
              .toList(),
        ),
      ),
    );
  }
}
