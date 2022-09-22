import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/my_text.dart';
import 'package:cosmetic_project/controllers/text_form_field.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:flutter/material.dart';

import '../../services/auth/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String firstName='';
  String lastName='';
  String email='';
  String password1='';
  String password2='';
  String phoneNumber='';
  String address='';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background_color,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: formKey,
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
                      MyTextFormField(
                          obsecure: false,
                          label: 'First Name',
                          onChanged: (x){
                            firstName=x;
                          },
                          validator: (x) {
                            if (x!.isEmpty) {
                              return 'Enter your name';
                            } else {
                              return null;
                            }
                          }),
                      MyTextFormField(
                          obsecure: false,
                          label: 'Last Name',
                          onChanged: (x){
                            lastName=x;
                          },
                          validator: (x) {
                            if (x!.isEmpty) {
                              return 'Enter your name';
                            } else {
                              return null;
                            }
                          }),
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
                          obsecure: false,
                          label: 'Phone',
                          onChanged: (x){
                            phoneNumber=x;
                          },
                          validator: (x) {
                            if (x!.length < 11 || x.isEmpty) {
                              return 'Invalid number';
                            } else {
                              return null;
                            }
                          }),
                      MyTextFormField(
                          obsecure: false,
                          label: 'Address',
                          onChanged: (x){
                            address=x;
                          },
                          validator: (x) {
                            if (x!.isEmpty) {
                              return 'Enter your address';
                            } else {
                              return null;
                            }
                          }),
                      MyTextFormField(
                          obsecure: true,
                          label: 'Password',
                          onChanged: (x){
                            password1=x;
                          },
                          validator: (x) {
                            if (x!.length < 8 || x.isEmpty) {
                              return 'Wrong password';
                            } else {
                              return null;
                            }
                          }),
                      MyTextFormField(
                          obsecure: true,
                          label: 'Confirm Password',
                          onChanged: (x){
                            password2=x;
                          },
                          validator: (x) {
                            if (x!=password1) {
                              return "Passwords don't match";
                            } else {
                              return null;
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: MyButton(
                          text: 'Sign Up',
                          onPress: () async {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                               AuthService.signUp(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, address: address, email: email, password1: password1, password2: password2);

                            }
                          },
                        ),
                      ),
                      const MyTextButton(
                        text: "Already have account? Sign In",
                        page: MyLogin(),
                      ),
                      const MyTextButton(
                        text: "or Continue as a guest",
                        page: MyPages(),
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
