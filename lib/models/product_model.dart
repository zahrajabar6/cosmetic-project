// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Product {
  final int productID;
  final String product_name;
  final String brand;
  final String category;
  final String color;
  final String description;
  final String ingredient;
  final String price;
  final String image_url;


  Product({
      required this.productID,
      required this.product_name,
      required this.brand,
      required this.category,
      required this.color,
      required this.description,
      required this.ingredient,
      required this.price,
      required this.image_url,
  });


  static List categories = <String>[
    'Makeup',
    'Skin Care',
    'Hair Care',
    'Body Care'
  ];

  static RxList<Product> filter = <Product>[].obs;



}


