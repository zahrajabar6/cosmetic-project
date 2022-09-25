import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/data/product_api.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:cosmetic_project/view/product%20page/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              if (Product.fav_products.contains(widget.product)) {
                Product.fav_products.remove(widget.product);
                ProductServices.removeFromFav(product: widget.product);
              } else {
                Product.fav_products.add(widget.product);
                ProductServices.addAsFav(product: widget.product);
              }
            }, child: Obx(() {
              return Icon(
                Product.fav_products.contains(widget.product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 24,
                color: Product.fav_products.contains(widget.product) ? Colors.red : grey,
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
                  // if (Product.isOnCart(product)) {
                  //   product.quantity += 1;
                  // } else {
                  //   Product.cart_products.add(product);
                  // }
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
              child: Center(
                child: Image(
                  image: NetworkImage(widget.product.image_url),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ProductDetails(
                product: widget.product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
