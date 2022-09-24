// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Product {
  final String product_name;
  final String brand;
  final String category;
  final String color;
  final String description;
  final String ingredient;
  final String price;
  final String image_url;


  Product({
      required this.product_name,
      required this.brand,
      required this.category,
      required this.color,
      required this.description,
      required this.ingredient,
      required this.price,
      required this.image_url});


  static RxList<Product> products = <Product>[].obs;
  static RxList<Product> fav_products = <Product>[].obs;
  static RxList<Product> cart_products = <Product>[].obs;

  static bool isFavorite(Product product) {
    bool isFav;
    if (fav_products.contains(product)) {
      isFav = true;
    } else {
      isFav = false;
    }
    return isFav;
  }

  static bool isOnCart(Product product) {
    bool isOnCart;
    if (cart_products.contains(product)) {
      isOnCart = true;
    } else {
      isOnCart = false;
    }
    return isOnCart;
  }

  static List categories = <String>[
    'Makeup',
    'Skin care',
    //'Hair Care',
    //'Body Care'
  ];
}


