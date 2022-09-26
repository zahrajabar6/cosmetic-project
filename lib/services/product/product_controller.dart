import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';

class ProductController{
  final Repository _repository;
  ProductController(this._repository);

  //get all product
  Future<List<Product>> fetchProductsList() async {
    return _repository.getProductsList();
  }


}