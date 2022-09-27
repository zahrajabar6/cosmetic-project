import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalRate extends StatefulWidget {
  const TotalRate({Key? key,required this.size, required this.product}) : super(key: key);

  final double size;
  final Product? product;



  @override
  State<TotalRate> createState() => _TotalRateState();
}

class _TotalRateState extends State<TotalRate> {

  double totalRate=0;
  @override
  Widget build(BuildContext context) {
    //dependency injections
    //var productController = ProductController(ProductRepository());
    //productController.getAvgRate(widget.product).then((value) => totalRate);
    return RatingBarIndicator(
      itemSize: widget.size,
      itemBuilder: (context, _)=>const Icon(Icons.star, color: Colors.amber),
      rating: 0,
    );
  }
}
