import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 60),
      decoration: BoxDecoration(
        color: background_color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(color: grey.withOpacity(0.10)),
      ),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  product!.product_name,
                  style: TextStyle(
                      fontSize: 30, color: grey, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '\$${product!.price}',
                style: TextStyle(
                    fontSize: 28, color: green, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            product!.brand,
            style: TextStyle(
                fontSize: 20,
                color: grey.withOpacity(0.70),
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            for (var i = 0; i < 4; i++)
              const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(Icons.star, size: 20, color: Colors.orange),
              ),
            const Icon(Icons.star, size: 20, color: Colors.grey),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Text(
                'Color:',
                style: TextStyle(
                    fontSize: 18, color: grey, fontWeight: FontWeight.bold),
              ),
              Text(
                product!.color,
                style: TextStyle(
                    fontSize: 16,
                    color: grey.withOpacity(0.70),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 18, color: grey, fontWeight: FontWeight.bold),
              ),
              Text(
                product!.description,
                style: TextStyle(
                    fontSize: 16,
                    color: grey.withOpacity(0.70),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ingrediant',
                style: TextStyle(
                    fontSize: 18, color: grey, fontWeight: FontWeight.bold),
              ),
              Text(
                product!.ingredient,
                style: TextStyle(
                    fontSize: 16,
                    color: grey.withOpacity(0.70),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
