import 'package:cosmetic_project/models/product_model.dart';

abstract class Repository{
  //get all products
  Future<List<Product>> getProductsList();
  Future<List<Product>> getFavList();
  //Future getProductsList();
}