import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
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
              const MyHeadingText(text: 'Create your account'),
              //MyTextField(hint: 'Name', myController: name),
              //MyTextField(hint: 'Email', myController: email),
              //MyTextField(hint: 'Phone', myController: phone),
              //MyTextField(hint: 'Address', myController: address),
              // MyTextField(hint: 'Password', myController: password),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: MyButton(text: 'Sign Up', page: MyPages()),
              ),
              const MyTextButton(
                text: "Already have account? Sign In",
                page: LoginPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
