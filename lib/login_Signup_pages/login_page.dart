import 'package:cosmetic_project/Home/home.dart';
import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/my_text.dart';
import 'package:cosmetic_project/login_Signup_pages/signup_page.dart';
import 'package:cosmetic_project/my_button.dart';
import 'package:cosmetic_project/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              MyHeadingText(text: 'Login to your account'),
              MyTextField(myController: email, hint: 'Email'),
              MyTextField(myController: password, hint: 'Password'),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: MyButton(text: 'Sign In', page: MyHomePage()),
              ),
              const MyTextButton(
                text: "Don't have account? Sign up",
                page: RegisterPage(),
              ),
              const MyTextButton(
                text: "or Continue as a guest",
                page: MyHomePage(),
              )
            ]),
      ),
    );
  }
}
