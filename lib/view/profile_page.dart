import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/my_text_field.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString phone = ''.obs;
  RxString password = ''.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('Profile',
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: const SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(
                          image: AssetImage('images/Profile.jpg'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextField(
                    icon: Icons.person,
                    readonly: true,
                    myController: nameController,
                    typed: name,
                    hint: 'Name',
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextField(
                    icon: Icons.email,
                    readonly: true,
                    myController: emailController,
                    typed: email,
                    hint: 'email',
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextField(
                    icon: Icons.phone,
                    readonly: true,
                    myController: phoneController,
                    typed: phone,
                    hint: 'Phone',
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextField(
                    icon: Icons.location_on,
                    readonly: true,
                    myController: addressController,
                    typed: address,
                    hint: 'Address',
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextField(
                    icon: Icons.password_rounded,
                    readonly: true,
                    myController: passwordController,
                    typed: password,
                    hint: 'Password',
                    obsecure: true,
                  ),
                ),
                MyButton(
                    text: 'Log Out',
                    onPress: () {
                      Get.to(const MyLogin());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
