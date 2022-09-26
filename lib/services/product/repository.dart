import 'package:cosmetic_project/models/product_model.dart';
import 'package:get/get.dart';

abstract class Repository{
  //get all products
  Future<List<Product>> getProductsList();

  //search
  Future<List<Product>> getSearch(RxString typed);

  //get favorite list
  Future<List<Product>> getFavList();

  //add to fav
  Future postToFav(Product? product);

  //delete from fav -- using PUT --
  Future delFromFav(Product? product);

}