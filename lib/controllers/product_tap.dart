import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTap extends StatelessWidget {
  const ProductTap({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey.withOpacity(0.10))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: Image(
                  image: AssetImage(product.image_url),
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                  child: Icon(Icons.star, size: 16, color: Colors.orange),
                ),
              const Icon(Icons.star, size: 16, color: Colors.grey),
            ])
          ]),
    );
  }
}
