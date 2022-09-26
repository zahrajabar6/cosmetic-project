import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/product_tap_one.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/view/category_page.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCategoryTap extends StatefulWidget {
  const MyCategoryTap({Key? key}) : super(key: key);

  @override
  State<MyCategoryTap> createState() => _MyCategoryTapState();
}

class _MyCategoryTapState extends State<MyCategoryTap> {
  //dependency injections
  var productController = ProductController(ProductRepository());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: Product.categories
            .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: MySubHeadingText(text: e)),
                          TextButton(
                              onPressed: () {
                                Get.to(MyCategoryPage(
                                  category: e,
                                ));
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    color: green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child:FutureBuilder<List<Product>>(
                          future: productController.fetchProductsList(),
                          builder: (context,snapshot){
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child:CircularProgressIndicator(color: green));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                var product = snapshot.data?[index];
                                if(product!.category ==e){return ProductTapOne(product: product);}else{return Container();}
                              },
                              itemCount: snapshot.data?.length ?? 0,
                            );
                          },
                        ),
                      )
                    ]),
        ),
        )
            .toList(),
      ),
    );
  }
}

// ListView(
// scrollDirection: Axis.horizontal,
// children: Product.products
//     .where((p) => p.category == e)
// .map((element) =>
// ProductTapOne(product: element))
// .toList()),