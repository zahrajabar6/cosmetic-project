import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/controllers/dismissible.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dependency injections
    var productController = ProductController(ProductRepository());
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
        body: Stack(
            fit: StackFit.expand,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<Product>>(
                        future: productController.fetchFavList(),
                        builder: (context,snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child:CircularProgressIndicator(color: green));
                          }
                          if(snapshot.data!.isEmpty){
                            return Center(child: Text("There's no any favorite product!", style: TextStyle(color: grey.withOpacity(0.50), fontSize: 24),));
                          }
                          return ListView.builder(
                            itemBuilder: (context,index){
                              var product = snapshot.data?[index];
                              return DismissibleWidget(
                                onDismissed: (direction){
                                  //Product.fav_products.remove(element);
                                  //ProductServices.removeFromFav(product: element);
                                  Get.snackbar('Oops!', 'Product has been deleted');
                                },
                                item: product,
                                child: ProductTapTwo(product: product)
                              );
                            },
                            itemCount: snapshot.data?.length ?? 0,
                          );
                        },
                      ),),
                  ],
                ),
              ),
            ]

        ),
      ),
    );
  }
}

// Product.fav_products.isNotEmpty? Obx(() {
// return ListView(
// children: Product.fav_products
//     .map((element) => DismissibleWidget(
// onDismissed: (direction) {
// //Product.fav_products.remove(element);
// //ProductServices.removeFromFav(product: element);
// Get.snackbar('Oops!', 'Product has been deleted');
// },
// item: element,
// child: ProductTapTwo(product: element))).toList(),
// );
// }
// ): Center(child: Text("There's no any favorite product!", style: TextStyle(color: grey.withOpacity(0.50), fontSize: 24),)),
//
