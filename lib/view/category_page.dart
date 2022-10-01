import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
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
    //dependency injections
    var productController = ProductController(ProductRepository());
    return Scaffold(
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
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: productController.fetchProductsList(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child:CircularProgressIndicator(color: green));
                  }
                  return ListView.builder(
                    itemBuilder: (context,index){
                      var product = snapshot.data?[index];
                      if(product!.category ==widget.category){return ProductTapTwo(product: product);}else{return Container();}
                    },
                    itemCount: snapshot.data?.length ?? 0,
                  );
                },
              ),
              ) ,
          ],
        ),
      ),
    );
  }
}
