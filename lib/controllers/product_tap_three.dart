import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/total_rate.dart';
import 'package:cosmetic_project/models/cart_model.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:cosmetic_project/view/product%20page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTapThree extends StatefulWidget {
  const ProductTapThree({Key? key, required this.item}) : super(key: key);

  final Cart? item;

  @override
  State<ProductTapThree> createState() => _ProductTapThreeState();
}

class _ProductTapThreeState extends State<ProductTapThree> {
  @override
  Widget build(BuildContext context) {
    //dependency injection
    var productController=ProductController(ProductRepository());
    return TextButton(
      onPressed: () {
        Get.to(ProductPage(
          product: widget.item!.product,
        ));
      },
      child: Container(
        height: 150,
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
                        image: NetworkImage(widget.item!.product.image_url),
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
                      widget.item!.product.product_name,
                      style: TextStyle(
                        fontSize: 16,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.item!.product.brand,
                      style: TextStyle(
                        fontSize: 14,
                        color: grey.withOpacity(0.50),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '\$${widget.item!.product.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TotalRate(product: widget.item!.product,size: 16,rating: 0,)
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      productController.increaseQuantity(widget.item);
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
                  Text(
                    widget.item!.quantity.toString(),//product.quantity.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: grey,
                        fontWeight: FontWeight.bold),
                     ),
                  TextButton(
                    onPressed: () {
                      productController.decreaseQuantity(widget.item);
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
