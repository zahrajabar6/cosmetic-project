import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_filtering_icon.dart';
import 'package:cosmetic_project/controllers/my_search_field.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySearchPage extends StatelessWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search_controller = TextEditingController();
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 4,
                        child: MySearchField(
                          myController: search_controller,
                        )),
                    const Expanded(flex: 1, child: FilteringButton())
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: Product.fav_products
                      .where((p) =>
                          p.product_name.toLowerCase() ==
                              search_controller.text.toLowerCase() ||
                          p.brand.toLowerCase() ==
                              search_controller.text.toLowerCase())
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
