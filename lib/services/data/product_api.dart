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
      print(data);
      print(data.runtimeType);
      for (var i in data) {
        Product product= Product(
            product_name: data[i]["name"],
            brand: data[i]["brand"]["brand_name"],
            category: data[i]["category"]["name"],
            color: data[i]["color"],
            description: data[i]["description"],
            ingredient: data[i]["ingredient"],
            price: data[i]["price"].toString(),
            image_url: data[i]["imageUrl"]);
        print(product);
      }
    }catch(e){
      print(e);
      Get.snackbar('Failed', "Check your connection");
    }
    //print(Product.products);
    //isLogin.value=false;
  }
}