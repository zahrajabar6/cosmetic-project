import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';
import 'package:get/get.dart';

class ProductController{
  final Repository _repository;
  ProductController(this._repository);

  //Product product;

  //get all product
  Future<List<Product>> fetchProductsList() async {
    return _repository.getProductsList();
  }

  //search
  Future<List<Product>> fetchSearchResult(RxString typed) async {
    return _repository.getSearch(typed);
  }

  //get favorite list
  Future<List<Product>> fetchFavList() async {
    return _repository.getFavList();
  }

  //add to favorite
  Future addToFavList(Product? product) async {
    return _repository.postToFav(product);
  }

  //remove from favorite
  Future removeFromFav(Product? product) async {
    return _repository.delFromFav(product);
  }


}