import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_filtering.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyCategoryPage extends StatefulWidget {
  const MyCategoryPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
  final List<String> filteringList = ["Price", "Rate"];
  final List<String> filteringItems = ['Default', 'Ascending', 'Descending'];
  String? firstselectedItem;
  String? seconedselectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                Get.to(const MyPages());
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: grey,
              )),
          title: Text(widget.category,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyFiltering(
                        items: filteringList,
                        selectedItem: firstselectedItem,
                        onChanged: (value) {
                          setState(() {
                            firstselectedItem = value;
                          });
                        },
                      ),
                      MyFiltering(
                        items: filteringItems,
                        selectedItem: seconedselectedItem,
                        onChanged: (value) {
                          setState(() {
                            seconedselectedItem = value;
                          });
                        },
                      ),
                    ]),
              ),
              Expanded(
                child: ListView(
                  // children: Product.products
                  //     .where((p) => p.category == widget.category)
                  //     .map((element) => ProductTapTwo(product: element))
                  //     .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
