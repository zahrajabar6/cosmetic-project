import 'package:get/get.dart';

class Product {
  final String product_name;
  final String brand;
  final String category;
  //final String description;
  //final String ingrediant;
  final String price;
  final String image_url;

  Product(
      this.product_name,
      this.brand,
      this.category, //this.description,this.ingrediant
      this.price,
      this.image_url);

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

Product product1 =
    Product('Lipstick', 'ILIA', 'Makeup', r'$28.00', 'images/ILIA.jpg');

Product product2 =
    Product('Eyeshadow', 'ILIA', 'Makeup', r'$28.00', 'images/ILIA.jpg');

Product product3 =
    Product('Maskara', 'ILIA', 'Makeup', r'$28.00', 'images/ILIA.jpg');

Product product4 =
    Product('Foundation', 'ILIA', 'Makeup', r'$28.00', 'images/ILIA.jpg');

Product product5 =
    Product('Mask', 'ILIA', 'Skin Care', r'$28.00', 'images/ILIA.jpg');

Product product6 =
    Product('Lotion', 'ILIA', 'Skin Care', r'$28.00', 'images/ILIA.jpg');

Product product7 =
    Product('Sun Block', 'ILIA', 'Skin Care', r'$28.00', 'images/ILIA.jpg');

Product product8 =
    Product('Toner', 'ILIA', 'Skin Care', r'$28.00', 'images/ILIA.jpg');

Product product9 =
    Product('Shampo', 'ILIA', 'Hair Care', r'$28.00', 'images/ILIA.jpg');

Product product10 =
    Product('anything1', 'ILIA', 'Hair Care', r'$28.00', 'images/ILIA.jpg');

Product product11 =
    Product('anything2', 'ILIA', 'Hair Care', r'$28.00', 'images/ILIA.jpg');

Product product12 =
    Product('anything3', 'ILIA', 'Hair Care', r'$28.00', 'images/ILIA.jpg');

Product product13 =
    Product('Lotion', 'ILIA', 'Body Care', r'$28.00', 'images/ILIA.jpg');

Product product14 =
    Product('anything4', 'ILIA', 'Body Care', r'$28.00', 'images/ILIA.jpg');

Product product15 =
    Product('anything5', 'ILIA', 'Body Care', r'$28.00', 'images/ILIA.jpg');

Product product16 =
    Product('anything6', 'ILIA', 'Body Care', r'$28.00', 'images/ILIA.jpg');
