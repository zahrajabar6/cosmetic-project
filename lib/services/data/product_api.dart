import 'package:cosmetic_project/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response ;

class ProductServices {
  static productsList() async {
    try {
      Response response = await Dio()
          .get('http://10.0.2.2:8000/api/Product/list-products',);
      List<dynamic> data = response.data;
      for (var item in data) {
        Product product = Product(
            productID: item["id"],
            product_name: item["name"],
            brand: item["brand"]["brand_name"],
            category: item["category"]["name"],
            color: item["color"],
            description: item["description"],
            ingredient: item["ingredient"],
            price: item["price"].toString(),
            image_url: item["imageUrl"]);
        if(!Product.products.contains(product)){
          Product.products.add(product);}
      }
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
  }

  static favList() async {
    try {
      Response response = await Dio()
          .get('http://10.0.2.2:8000/api/Product/list_favorite',);
      List<dynamic> data = response.data;
      for (var item in data) {
        Product product = Product(
            productID: item["id"],
            product_name: item["name"],
            brand: item["brand"]["brand_name"],
            category: item["category"]["name"],
            color: item["color"],
            description: item["description"],
            ingredient: item["ingredient"],
            price: item["price"].toString(),
            image_url: item["imageUrl"]);
        Product.fav_products.add(product);
      }
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
  }

  static addAsFav({required Product product}) async {
    int productID = product.productID;
    try {
      await Dio().put('http://10.0.2.2:8000/api/Product/set_favorite?id=$productID',);
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
  }

  static removeFromFav({required Product product}) async {
    int productID = product.productID;
    try {
      await Dio().put('http://10.0.2.2:8000/api/Product/Remove_favorite?id=$productID',);
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
  }
}