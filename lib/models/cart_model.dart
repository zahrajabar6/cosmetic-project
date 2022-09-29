// ignore_for_file: non_constant_identifier_names

import 'package:cosmetic_project/models/product_model.dart';

class Cart {
  final int itemID;
  final int quantity;
  final Product product;


  Cart(  {
    required this.itemID,
    required this.quantity,
    required this.product,

  });
}


