import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/text_form_field.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:cosmetic_project/services/data/product_api.dart';
import 'package:cosmetic_project/view/login_Signup_pages/signup_page.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          'images/logo.png',
                          width: 126,
                          height: 126,
                        ),
                      ),
                      const MyHeadingText(text: 'Login to your account'),
                      MyTextFormField(
                          obsecure: false,
                          label: 'Email',
                          onChanged: (x){
                            email=x;
                          },
                          validator: (x) {
                            String pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = RegExp(pattern);
                            if (x!.isEmpty || !regex.hasMatch(x)) {
                              return 'Enter a valid email address';
                            } else {
                              return null;
                            }
                          }),
                      MyTextFormField(
                          obsecure: true,
                          label: 'Password',
                          onChanged: (x){
                            password=x;
                          },
                          validator: (x) {
                            if (x!.length < 8 || x.isEmpty) {
                              return 'Your password is short';
                            } else {
                              return null;
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: MyButton(
                          isLoading: AuthService.isLogin ,
                          text: 'Sign In',
                          onPress: () async {
                            FocusScope.of(context).unfocus();

                            if (formKey.currentState!.validate()) {
                              AuthService.signIn(email: email, password: password);
                              ProductServices.productsList();
                              ProductServices.favList();
                            }
                          },
                        ),
                      ),
                       MyTextButton(
                        text: "Don't have account? Sign up",
                        onPressed: (){
                          FocusScope.of(context).unfocus();
                          Get.to(const RegisterPage());
                        },
                      ),
                      MyTextButton(
                        text: "or Continue as a guest",
                        onPressed: (){
                          FocusScope.of(context).unfocus();
                          Get.to(const MyPages());
                          ProductServices.productsList();
                          ProductServices.favList();
                        },
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
