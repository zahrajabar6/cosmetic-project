import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/product_tap_three.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/controllers/dismissible.dart';
import 'package:cosmetic_project/view/cart/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text('Cart',
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
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:Product.cart_products.isNotEmpty? Obx(() {
                  return ListView(
                    children: Product.cart_products
                        .map((element) => DismissibleWidget(
                            onDismissed: (direction) {
                              Product.cart_products.remove(element);
                              Get.snackbar('Oops!', 'Product has been deleted');
                            },
                            item: element,
                            child: ProductTapThree(product: element)),
                    ).toList(),);
                }):Center(child: Text("Cart is Empty!", style: TextStyle(color: grey.withOpacity(0.50), fontSize: 24),)),
              ),
              const OrderDetails(),
            ],
          )),
    );
  }
}
