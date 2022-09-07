import 'package:cosmetic_project/Home/home.dart';
import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/my_text.dart';
import 'package:cosmetic_project/my_button.dart';
import 'package:cosmetic_project/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List hints = <String>['Name', 'Email', 'Phone', 'Address', 'Password'];
  final List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Flexible(
              child: ListView.builder(
                itemCount: hints.length,
                itemBuilder: ((context, index) {
                  _controllers.add(TextEditingController());
                  return MyTextField(
                      myController: _controllers[index], hint: hints[index]);
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: MyButton(text: 'Sign Up', page: MyHomePage()),
            ),
            const MyTextButton(
              text: "Already have account? Sign In",
              page: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}
