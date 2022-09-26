// import 'package:cosmetic_project/models/account.dart';
// import 'package:cosmetic_project/models/product_model.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide Response ;
//
// class ProductServices {
//   static productsList() async {
//     try {
//       Response response = await Dio()
//           .get('http://10.0.2.2:8000/api/Product/list-products',);
//       List<dynamic> data = response.data;
//       for (var item in data) {
//         Product product = Product(
//             productID: item["id"],
//             product_name: item["name"],
//             brand: item["brand"]["brand_name"],
//             category: item["category"]["name"],
//             color: item["color"],
//             description: item["description"],
//             ingredient: item["ingredient"],
//             price: item["price"].toString(),
//             image_url: item["imageUrl"]);
//         if(!Product.products.contains(product)){
//           Product.products.add(product);}
//       }
//     } catch (e) {
//       Get.snackbar('Failed', "Check your connection");
//     }
//   }
//
//   // static favList() async {
//   //   try {
//   //     Dio dio = Dio();
//   //     dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
//   //     Response response = await dio
//   //         .get('http://10.0.2.2:8000/api/Product/list_favorite',);
//   //     List<dynamic> data = response.data;
//   //     for (var item in data) {
//   //       Product product = Product(
//   //           productID: item['product']["id"],
//   //           product_name: item['product']["name"],
//   //           brand: item['product']["brand"]["brand_name"],
//   //           category: item['product']["category"]["name"],
//   //           color: item['product']["color"],
//   //           description: item['product']["description"],
//   //           ingredient: item['product']["ingredient"],
//   //           price: item['product']["price"].toString(),
//   //           image_url: item['product']["imageUrl"]);
//   //       Product.fav_products.add(product);
//   //     }
//   //   } catch (e) {
//   //     Get.snackbar('Failed', "Check your connection");
//   //   }
//   // }
//
//   // static addAsFav({required Product product}) async {
//   //   int productID = product.productID;
//   //   Dio dio = Dio();
//   //   dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
//   //   try {
//   //     await dio.put('http://10.0.2.2:8000/api/Product/set_favorite?id=$productID',);
//   //   } catch (e) {
//   //     print(e);
//   //     Get.snackbar('Failed', "Check your connection");
//   //   }
//   // }
//
//   // static removeFromFav({required Product product}) async {
//   //   int productID = product.productID;
//   //   Dio dio = Dio();
//   //   dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
//   //   try {
//   //     await dio.put('http://10.0.2.2:8000/api/Product/Remove_favorite?id=$productID',);
//   //   } catch (e) {
//   //     print(e);
//   //     Get.snackbar('Failed', "Check your connection");
//   //   }
//   // }
//
//
//   // static filtering({required String filterOn,required String filterBy }) async {
//   //   try {
//   //     Response response = await Dio().get('http://10.0.2.2:8000/api/list-products?filterOn=$filterOn&filterBy=$filterBy');
//   //     List<dynamic> data = response.data;
//   //     print(response);
//   //     for (var item in data) {
//   //       Product product = Product(
//   //           productID: item["id"],
//   //           product_name: item["name"],
//   //           brand: item["brand"]["brand_name"],
//   //           category: item["category"]["name"],
//   //           color: item["color"],
//   //           description: item["description"],
//   //           ingredient: item["ingredient"],
//   //           price: item["price"].toString(),
//   //           image_url: item["imageUrl"]);
//   //         Product.filter.add(product);
//   //         print(product.product_name);
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //     Get.snackbar('Failed', "Check your connection");
//   //   }
//   // }
// }