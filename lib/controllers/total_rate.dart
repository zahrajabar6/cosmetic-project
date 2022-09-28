import 'package:cosmetic_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalRate extends StatefulWidget {
  const TotalRate({Key? key,required this.size, required this.product, required this.rating}) : super(key: key);

  final double size;
  final Product? product;
  final double rating;

  @override
  State<TotalRate> createState() => _TotalRateState();
}

class _TotalRateState extends State<TotalRate> {

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: widget.size,
      itemBuilder: (context, _)=>const Icon(Icons.star, color: Colors.amber),
      rating: widget.rating,
    );
  }
}
