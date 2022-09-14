// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Product {
  final String product_name;
  final String brand;
  final String category;
  final String color;
  final String description;
  final String ingrediant;
  final String price;
  final String image_url;
  RxInt quantity;

  Product(
      this.product_name,
      this.brand,
      this.category,
      this.color,
      this.description,
      this.ingrediant,
      this.price,
      this.image_url,
      this.quantity);

  //static RxDouble SubTotal = (0.0).obs;
  //static RxDouble Total = (0.0).obs;
  //static RxDouble Discount = (0.0).obs;
  //static RxDouble DilevaryCharge = (10.0).obs;

  static RxList<Product> fav_products = <Product>[].obs;
  static RxList<Product> cart_products = <Product>[].obs;

  static bool isFavorite(Product product) {
    bool isFav;
    if (fav_products.contains(product)) {
      isFav = true;
    } else {
      isFav = false;
    }
    return isFav;
  }

  static bool isOnCart(Product product) {
    bool isOnCart;
    if (cart_products.contains(product)) {
      isOnCart = true;
    } else {
      isOnCart = false;
    }
    return isOnCart;
  }

  static RxList<Product> products = <Product>[
    product1,
    product2,
    product3,
    product4,
    product5,
    product6,
    product7,
    product8,
    product9,
    product10,
    product11,
    product12,
    product13,
    product14,
    product15,
    product16,
  ].obs;

  static List categories = <String>[
    'Makeup',
    'Skin Care',
    'Hair Care',
    'Body Care'
  ];
}

//testing

Product product1 = Product(
    'Lipstick',
    'ILIA',
    'Makeup',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    '''- Apricot Seed Oil: Locks in moisture.
- Castor Seed Oil: Softens and soothes.
- Mango Seed Butter: Boosts elasticity.''',
    r'$28.00',
    'images/ILIA.jpg',
    1.obs);

Product product2 = Product(
    'Eyeshadow',
    'ILIA',
    'Makeup',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$29.00',
    'images/ILIA.jpg',
    1.obs);

Product product3 = Product(
    'Maskara',
    'ILIA',
    'Makeup',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$30.00',
    'images/ILIA.jpg',
    1.obs);

Product product4 = Product(
    'Foundation',
    'ILIA',
    'Makeup',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$31.00',
    'images/ILIA.jpg',
    1.obs);

Product product5 = Product(
    'Mask',
    'ILIA',
    'Skin Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$32.00',
    'images/ILIA.jpg',
    1.obs);

Product product6 = Product(
    'Lotion',
    'ILIA',
    'Skin Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$40.00',
    'images/ILIA.jpg',
    1.obs);

Product product7 = Product(
    'Sun Block',
    'ILIA',
    'Skin Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$40.55',
    'images/ILIA.jpg',
    1.obs);

Product product8 = Product(
    'Toner',
    'ILIA',
    'Skin Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$50.00',
    'images/ILIA.jpg',
    1.obs);

Product product9 = Product(
    'Shampo',
    'ILIA',
    'Hair Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$60.00',
    'images/ILIA.jpg',
    1.obs);

Product product10 = Product(
    'anything1',
    'ILIA',
    'Hair Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$72.00',
    'images/ILIA.jpg',
    1.obs);

Product product11 = Product(
    'anything2',
    'ILIA',
    'Hair Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$94.50',
    'images/ILIA.jpg',
    1.obs);

Product product12 = Product(
    'anything3',
    'ILIA',
    'Hair Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$80.00',
    'images/ILIA.jpg',
    1.obs);

Product product13 = Product(
    'Lotion',
    'ILIA',
    'Body Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$33.00',
    'images/ILIA.jpg',
    1.obs);

Product product14 = Product(
    'anything4',
    'ILIA',
    'Body Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$100.00',
    'images/ILIA.jpg',
    1.obs);

Product product15 = Product(
    'anything5',
    'ILIA',
    'Body Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$48.00',
    'images/ILIA.jpg',
    1.obs);

Product product16 = Product(
    'anything6',
    'ILIA',
    'Body Care',
    'Amberlight ',
    'A clean, handcrafted lipstick with high-impact color and supreme hydration for all-day wear and care.',
    ' - Apricot Seed Oil: Locks in moisture. - Castor Seed Oil: Softens and soothes. - Mango Seed Butter: Boosts elasticity.',
    r'$58.00',
    'images/ILIA.jpg',
    1.obs);
