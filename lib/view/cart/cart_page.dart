import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/product_tap_three.dart';
import 'package:cosmetic_project/models/cart_model.dart';
import 'package:cosmetic_project/controllers/dismissible.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:cosmetic_project/services/product/product_controller.dart';
import 'package:cosmetic_project/services/product/product_repository.dart';
import 'package:cosmetic_project/view/cart/order_details.dart';
import 'package:cosmetic_project/view/login_Signup_pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dependency injections
    var productController = ProductController(ProductRepository());
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text('Cart',
                style: TextStyle(
                    color: grey, fontSize: 26, fontWeight: FontWeight.bold)),
            centerTitle: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:AuthService.hasAccount.value? FutureBuilder<List<Cart>>(
                  future: productController.fetchCartList(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child:CircularProgressIndicator(color: green));
                    }
                    if(snapshot.data!.isEmpty){
                      return Center(child: Text("Cart is Empty!", style: TextStyle(color: grey.withOpacity(0.50), fontSize: 24),));
                    }
                    return ListView.builder(
                      itemBuilder: (context,index){
                        var item = snapshot.data?[index];
                        return DismissibleWidget(
                            onDismissed: (direction){
                              productController.deleteFromCart(item);
                              Get.snackbar('Oops!', 'Product has been deleted');
                            },
                            item: item,
                            child: ProductTapThree(item: item,)
                        );
                      },
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  },
                ):Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("You don't Have account?", style: TextStyle(color: grey, fontSize: 24),),
                    ),
                    SizedBox(width:150,
                        child: MyButton(text: 'Register', onPress: (){Get.to(const RegisterPage());}, isLoading: false.obs))
                  ],),
              ),
              const OrderDetails(),
            ],
          )),
    );
  }
}
