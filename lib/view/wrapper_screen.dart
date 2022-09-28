import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/onboarding%20screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:cosmetic_project/services/auth/localdb.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  login() async{
    await Future.delayed(Duration(seconds: 4));
    try{
      String? email = DB.prefs.getString('email');
      String? password = DB.prefs.getString('password');

      if(email != null && password != null){
        AuthService.signIn(email: email, password: password);
      }else{
        bool? showLogin = DB.prefs.getBool('showLogin');
        if(showLogin != null && showLogin){
         Get.to(MyLogin());
        }else{
          Get.to(Onboarding());
        }
      }
    }catch(e){
      Get.to(Onboarding());
    }
  }
  @override
  Widget build(BuildContext context) {
    login();
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 240,
                height: 240,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'Pure Beauty',
                  style:
                  TextStyle(color: grey, fontSize: 60, fontFamily: 'Ole'),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: green,
                  strokeWidth: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
