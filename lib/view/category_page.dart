import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_filtering.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
//import 'package:cosmetic_project/services/data/product_api.dart';
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
  final List<String> filteringList = ['Default',"Price","Name"];
  final List<String> filteringItems = ['Default', 'Ascending', 'Descending'];
  String? firstSelectedItem;
  String? secondSelectedItem;
  RxBool isFiltered = false.obs;

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
                        text: 'Filter On',
                        items: filteringList,
                        selectedItem: firstSelectedItem,
                        onChanged: (value) {
                          isFiltered.value=true;
                          Product.filter.clear();
                          setState(() {
                            firstSelectedItem = value;
                          });
                          print(firstSelectedItem);
                          //ProductServices.filtering(filterOn: firstSelectedItem??'Default', filterBy: secondSelectedItem??'Default');
                        },
                      ),
                      MyFiltering(
                        text: 'Filter By',
                        items: filteringItems,
                        selectedItem: secondSelectedItem,
                        onChanged: (value) {
                          isFiltered.value=true;
                          setState(() {
                            secondSelectedItem = value;
                          });
                          Product.filter.clear();
                          //ProductServices.filtering(filterOn: firstSelectedItem??'Default', filterBy: secondSelectedItem??'Default');
                        },
                      ),
                    ]),
              ),
              Expanded(
                child: !isFiltered.value? ListView(
                  children: Product.products
                      .where((p) => p.category == widget.category)
                      .map((element) => ProductTapTwo(product: element))
                      .toList(),
                ):Obx((){
                    return ListView(
                      children: Product.filter
                          .where((p) => p.category == widget.category)
                          .map((element) => ProductTapTwo(product: element))
                          .toList(),
                    );
                  }
                ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
