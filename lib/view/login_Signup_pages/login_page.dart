import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/view/login_Signup_pages/signup_page.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:cosmetic_project/controllers/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'images/logo.png',
                      width: 126,
                      height: 126,
                    ),
                  ),
                  const MyHeadingText(text: 'Login to your account'),
                  MyTextField(
                    hint: 'Email',
                    myController: email,
                    //validator: (x) {
                    //x = email.text;
                    //  validateEmail(x);
                    //  },
                    //errorText: 'Error',
                  ),
                  MyTextField(
                    hint: 'Password',
                    myController: password,
                    //validator: (x) {
                    //   x = password.text;
                    // },
                    //errorText: 'error',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: MyButton(text: 'Sign In', page: MyPages()),
                  ),
                  const MyTextButton(
                    text: "Don't have account? Sign up",
                    page: RegisterPage(),
                  ),
                  const MyTextButton(
                    text: "or Continue as a guest",
                    page: MyPages(),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
