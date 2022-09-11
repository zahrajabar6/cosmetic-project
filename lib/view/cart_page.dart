import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/product_tap_two.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: Product.cart_products
                      .map((element) => ProductTapTwo(product: element))
                      .toList(),
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  maxChildSize: 0.4,
                  builder: (context, scrollController) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: background_color,
                            border: Border(
                                top:
                                    BorderSide(color: grey.withOpacity(0.10)))),
                        padding: EdgeInsets.all(20),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Center(
                                child: Text(
                                  'Order Details',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                    'Sub Total',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: grey.withOpacity(0.50),
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${Product.SubTotal.toString()}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: grey.withOpacity(0.50),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                    'Discount',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: grey.withOpacity(0.50),
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${Product.Discount.toString()}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: grey.withOpacity(0.50),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                    'Delivery charge',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: grey.withOpacity(0.50),
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${Product.DilevaryCharge.toString()}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: grey.withOpacity(0.50),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${Product.Total.toString()}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ),
                            MyButton(
                                text: 'Place Order',
                                onPress: () {
                                  //Product.SubTotal.value = 0;
                                  //Product.Total.value = 0;
                                  //Product.Discount.value = 0;
                                  //Product.DilevaryCharge.value = 0;
                                  Product.cart_products.clear();
                                })
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
