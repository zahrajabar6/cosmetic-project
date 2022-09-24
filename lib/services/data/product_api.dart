import 'dart:convert';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response ;

class ProductServices{
  static productsList() async {
    try{
      Response response = await Dio()
          .get('http://10.0.2.2:8000/api/Product/list-products',);
      List<dynamic> data = response.data;
      for (var item in data) {
        Product product= Product(
            product_name: item["name"],
            brand: item["brand"]["brand_name"],
            category: item["category"]["name"],
            color: item["color"],
            description: item["description"],
            ingredient: item["ingredient"],
            price: item["price"].toString(),
            image_url: item["imageUrl"]);
        Product.products.add(product);
      }
    }catch(e){
      print(e);
      Get.snackbar('Failed', "Check your connection");
    }
    //print(Product.products);
    //isLogin.value=false;
  }
}