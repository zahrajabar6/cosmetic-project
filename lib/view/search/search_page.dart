import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/controllers/search_field.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:cosmetic_project/view/search/searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  //dependency injections
  var productController = ProductController(ProductRepository());
  final TextEditingController myController = TextEditingController();
  RxString typed = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Search',
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
                    child: MySearchField(
                      icon: Icons.search_rounded,
                      hint: 'Search...',
                      myController: myController,
                      typed: typed,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return typed.isNotEmpty
                    ? FutureBuilder<List<Product>>(
                    future: productController.fetchSearchResult(typed),
                    builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child:CircularProgressIndicator(color: green));
                    }
                    return ListView.builder(
                        itemBuilder: (context,index){
                        var product = snapshot.data?[index];
                        return ProductTapTwo(product: product);
                      },
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  },
                )
                : const Searching();
              }),
            )
          ],
        ),
      ),
    );
  }
}
