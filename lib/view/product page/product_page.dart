import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/models/product_model.dart';
import 'package:cosmetic_project/services/auth/localdb.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:cosmetic_project/view/product%20page/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
   const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product? product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    RxBool isPressed = false.obs;
    //dependency injection
    var productController=ProductController(ProductRepository());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: grey,
            )),
        title: Text('Product',
            style: TextStyle(
                color: grey, fontSize: 26, fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: () {

            isPressed.value=!isPressed.value;
            if(isPressed.value){
              productController.addToFavList(widget.product);
            }else{
              productController.removeFromFav(widget.product);
            }
              },
                child: Obx((){
                    return Icon(
                      isPressed.value? Icons.favorite : Icons.favorite_border,
                      size: 24,
                      color:isPressed.value? Colors.red: grey,
                        );
                  }
                )
              )
        ],
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 47,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: green),
            child:MyButton(
              isLoading: ProductRepository.isAdding,
              text: 'Add to cart',
              onPress: () async {
                  productController.addToCart(widget.product);
                }
            ),

          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Image(
                image: NetworkImage(widget.product!.image_url),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ProductDetails(
              product: widget.product,
            ),
          ),
        ],
      ),
    );
  }
}
