import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/models/order_details.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:cosmetic_project/view/cart/order_prices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dependency injection
    var orderController=ProductController(ProductRepository());
    var checkOutController=ProductController(ProductRepository());

    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.6,
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
                 FutureBuilder<Order?>(
                    future: orderController.createOrder(),
                    builder: (context,snapshot){
                       if(snapshot.connectionState == ConnectionState.waiting){
                        return const OrderPrices(
                            subTotal: r'$0.00',
                            discount: r'$0.00',
                            total: r'$0.00'
                        );
                      }
                       return OrderPrices(
                         subTotal: '\$${snapshot.data!.subTotal}',
                         discount: '\$${snapshot.data!.discount}',
                         total: '\$${snapshot.data!.total}'
                       );
                    }
                  ),
                  MyButton(
                      isLoading: false.obs ,
                      text: 'Place Order',
                      onPress: () {
                          checkOutController.checkOutOrder();
                          Get.snackbar('Done!', 'Your order is coming..');
                      })
                ],
              ),
            ),
          );
        });
  }
}
