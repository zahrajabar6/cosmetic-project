import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.15,
        minChildSize: 0.15,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                  color: background_color,
                  border:
                      Border(top: BorderSide(color: grey.withOpacity(0.10)))),
              padding: const EdgeInsets.all(20),
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
                        r'$0.00',
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
                        r'$0.00',
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
                        r'$10.00',
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
                        r'$0.00',
                        style: TextStyle(
                            fontSize: 22,
                            color: green,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  MyButton(
                      isLoading: false.obs ,
                      text: 'Place Order',
                      onPress: () {
                        if (Product.cart_products.isNotEmpty) {
                          Product.cart_products.clear();
                          Get.snackbar('Done!', 'Your order is coming..');
                        }
                      })
                ],
              ),
            ),
          );
        });
  }
}
