import 'dart:convert';
import 'package:cosmetic_project/models/account.dart';
import 'package:cosmetic_project/models/cart_model.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ProductRepository implements Repository{
  String baseURL='http://10.0.2.2:8000/api';
  static RxBool isAdding = false.obs;

  //get all products
  @override
  Future<List<Product>> getProductsList() async{
    List<Product> products=[];
    String url = '$baseURL/Product/list-products';
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
    String url = '$baseURL/Product/list_favorite';
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

  // //add product to favorite
  // @override
  // Future postToFav(Product? product) async{
  //   int productID = product!.productID;
  //   //print(productID);
  //   String url = '$baseURL/Product/add_favorite?product_id=$productID';
  //   //print(url);
  //   Dio dio = Dio();
  //   dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
  //   try {
  //     Response response=await dio.post(url);
  //     //print(response);
  //   } catch (e) {
  //     //print(e);
  //   }
  // }

  // @override
  // Future delFromFav(Product? product) async{
  //   int productID = product!.productID;
  //   //print(productID);
  //   String url = '$baseURL/Product/Remove_favorite?product_id=$productID';
  //   Dio dio = Dio();
  //   dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
  //   try {
  //     Response response = await dio.put(url);
  //     //print(response);
  //   } catch (e) {
  //     //print(e);
  //   }
  // }

  @override
  Future<List<Product>> getSearch(RxString typed) async{
    List<Product> searchedProducts=[];
    String url = '$baseURL/Product/list-products?query=$typed';
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

  //get Cart list
  @override
  Future<List<Cart>> getCartList() async{
    List<Cart> cart=[];
    String url = '$baseURL/Order/cart';
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
          image_url: item['product']["imageUrl"],);

        Cart cartItem = Cart(
            itemID: item["id"],
            quantity: item["item_qty"],
            product: product,
        );
        cart.add(cartItem);
      }
    } catch (e) {
      Get.snackbar('Failed', "Check your connection");
    }
    return cart;
  }

  //add to cart
  @override
  Future postToCart(Product? product) async{
    isAdding.value=true;
    String url = '$baseURL/Order/add_to_cart';
    int productID = product!.productID;
    try{
      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
      Response response = await dio.post(url,
      data: jsonEncode({
        "product_id": productID,
        "item_qty": 1
      }),
      );
      isAdding.value=false;
      Get.snackbar('Done', response.data['detail']);
    }catch(e){
      Get.snackbar('Failed', 'Check your connection');
    }
  }

  //DELETE from cart
  @override
  Future postfromCart(Cart? cartItem) async{
    int itemID = cartItem!.itemID;
    String url = '$baseURL/Order/delete-item?item_id=$itemID';
    try{
      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
      Response response = await dio.post(url);
      Get.snackbar('Done', response.data['detail']);
    }catch(e){
      Get.snackbar('Failed', 'Check your connection');
    }
  }

  //increase item quantity in cart
  @override
  Future increaseQuantity(Cart? cartItem) async{
    int itemID = cartItem!.itemID;
    String url = '$baseURL/Order/increase-quantity?item_id=$itemID';
    try{
      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
      await dio.post(url);
    }catch(e){
      Get.snackbar('Failed', 'Check your connection');
    }
  }

  //decrease item quantity in cart
  @override
  Future decreaseQuantity(Cart? cartItem) async{
    int itemID = cartItem!.itemID;
    String url = '$baseURL/Order/reduce_qty?item_id=$itemID';
    try{
      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
      await dio.post(url);
    }catch(e){
      Get.snackbar('Failed', 'Check your connection');
    }
  }
}