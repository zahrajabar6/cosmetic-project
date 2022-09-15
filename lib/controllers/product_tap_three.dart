import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/view/product%20page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTapThree extends StatelessWidget {
  const ProductTapThree({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(ProductPage(
          product: product,
        ));
      },
      child: Container(
        height: 130,
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: grey.withOpacity(0.10))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: Image(
                      image: AssetImage(product.image_url),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.product_name,
                      style: TextStyle(
                        fontSize: 16,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.brand,
                      style: TextStyle(
                        fontSize: 14,
                        color: grey.withOpacity(0.50),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 14,
                        color: green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      for (var i = 0; i < 4; i++)
                        const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child:
                              Icon(Icons.star, size: 16, color: Colors.orange),
                        ),
                      const Icon(Icons.star, size: 16, color: Colors.grey),
                    ])
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      product.quantity += 1;
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: green,
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Obx(() {
                      return Text(
                        product.quantity.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: grey,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                  TextButton(
                    onPressed: () {
                      if (product.quantity > 1) {
                        product.quantity -= 1;
                      } else {
                        product.quantity.value = 0;
                        Product.cart_products.remove(product);
                        Get.snackbar('Oops!', 'Product has been deleted');
                      }
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: green,
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
