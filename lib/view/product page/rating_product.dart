import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key,required this.size, required this.product}) : super(key: key);

  final double size;
  final Product? product;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
            minRating: 1,
            updateOnDrag: true,
            glow:false,
            itemSize: widget.size,
            itemBuilder: (context, _)=>const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating)=>setState(() {
              //dependency injections
              var productController = ProductController(ProductRepository());
              productController.Rate(widget.product, rating);
            }),
        );


  }
}
