import 'package:cosmetic_project/models/account.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ProductRepository implements Repository{
  String baseURL='http://10.0.2.2:8000/api/Product';

  //get all products
  @override
  Future<List<Product>> getProductsList() async{
    List<Product> products=[];
    String url = '$baseURL/list-products';
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
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
          products.add(product);
      }
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
    return products;
  }

  //get favorite list
  @override
  Future<List<Product>> getFavList() async{
    List<Product> favList=[];
    String url = '$baseURL/list_favorite';
    try {
      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
      Response response = await dio.get(url);
      List<dynamic> data = response.data;

      for (var item in data) {
        Product product = Product(
            productID: item['product']["id"],
            product_name: item['product']["name"],
            brand: item['product']["brand"]["brand_name"],
            category: item['product']["category"]["name"],
            color: item['product']["color"],
            description: item['product']["description"],
            ingredient: item['product']["ingredient"],
            price: item['product']["price"].toString(),
            image_url: item['product']["imageUrl"]);
        favList.add(product);
      }
    } catch (e) {
      //catch error
    }
    return favList;
  }

  //add product to favorite
  @override
  Future postToFav(Product? product) async{
    int productID = product!.productID;
    print(productID);
    String url = '$baseURL/add_favorite?product_id=$productID';
    print(url);
    Dio dio = Dio();
    dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
    try {
      Response response=await dio.post(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future delFromFav(Product? product) async{
    int productID = product!.productID;
    print(productID);
    String url = '$baseURL/Remove_favorite?product_id=$productID';
    Dio dio = Dio();
    dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
    try {
      Response response = await dio.put(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<Product>> getSearch(RxString typed) async{
    List<Product> searchedProducts=[];
    String url = '$baseURL/list-products?query=$typed';
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
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
        searchedProducts.add(product);
      }
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
    return searchedProducts;
  }
}