import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ProductRepository implements Repository{
  String baseURL='http://10.0.2.2:8000/api/Product';

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

}