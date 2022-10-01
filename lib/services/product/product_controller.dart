// ignore_for_file: non_constant_identifier_names

import 'package:cosmetic_project/models/cart_model.dart';
import 'package:cosmetic_project/models/order_details.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/product/repository.dart';
import 'package:get/get.dart';

class ProductController{
  final Repository _repository;
  ProductController(this._repository);

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

  //get Cart list
  Future<List<Cart>> fetchCartList() async {
    return _repository.getCartList();
  }

  //add to Cart
  Future addToCart(Product? product) async{
    return _repository.postToCart(product);
  }

  //delete from Cart
  Future deleteFromCart(Cart? cartItem) async{
    return _repository.postfromCart(cartItem);
  }

  //increase item quantity in cart
  Future increaseQuantity(Cart? cartItem) async{
    return _repository.increaseQuantity(cartItem);
  }

  //decrease item quantity in cart
  Future decreaseQuantity(Cart? cartItem) async{
    return _repository.decreaseQuantity(cartItem);
  }

  //create order
  Future<Order> createOrder() async{
    return _repository.createOrder();
  }

  //check out order
  Future checkOutOrder() async{
    return _repository.checkOutOrder();
  }

  //set rate to product
  Future Rate(Product? product, double rate) async{
    return _repository.postRate(product, rate);
  }

  //get average rate of product
  Future<double> getAvgRate(Product? product) async{
    return _repository.getAvgRate(product);
  }
}