import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('Favorite',
              style: TextStyle(
                  color: grey, fontSize: 26, fontWeight: FontWeight.bold)),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: Product.fav_products
                      .map((element) => ProductTapTwo(product: element))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
