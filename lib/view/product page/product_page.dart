import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:cosmetic_project/view/product%20page/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;
  static RxBool isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                Get.to(MyPages());
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: grey,
              )),
          title: Text('Product',
              style: TextStyle(
                  color: grey, fontSize: 26, fontWeight: FontWeight.bold)),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(onPressed: () {
              isPressed.value = !isPressed.value;
              if (isPressed.value) {
                Product.fav_products.add(product);
                print(Product.fav_products);
              } else {
                Product.fav_products.remove(product);
                print(Product.fav_products);
              }
            }, child: Obx(() {
              return Icon(
                isPressed.value ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color: isPressed.value ? Colors.red : grey,
              );
            }))
          ],
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 47,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: green),
              child: TextButton(
                onPressed: () {
                  Product.cart_products.add(product);
                  print(Product.cart_products);
                },
                child: Center(
                  child: Text(
                    'Add to cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: light_green),
                  ),
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image(image: AssetImage(product.image_url)),
            ),
            Expanded(
              flex: 1,
              child: ProductDetails(
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
