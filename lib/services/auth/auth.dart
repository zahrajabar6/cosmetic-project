import 'dart:convert';

import 'package:cosmetic_project/models/account.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response ;

class AuthService {
  static RxBool isBusy = false.obs;

  static signin({required String email, required String password}) async {
    isBusy.value=true;
    try{
      Response response = await Dio()
          .post('http://10.0.2.2:8000/api/auth/signin',
      data:
      jsonEncode({
        "email": email ,
        "password": password ,
      }),
      );
      Map data = response.data["account"];
      Account account = Account(firstName: data["first_name"], lastname: data["last_name"], email: data["email"],phone: data["phone_number"],address: data["address"]);
      Account.currentAccount = account;
      Get.offAll(const MyPages());
    }catch(e){
      Get.snackbar('Failed', "You don't have account");
    }
    isBusy.value=false;
  }

  static signup({required String firstName,required String lastName,required String phoneNumber,required String address,required String email, required String password1,required String password2}) async {
    try{
      isBusy.value=true;
      Response response = await Dio()
          .post('http://10.0.2.2:8000/api/auth/signup',
        data:
        jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password1": password1,
          "password2": password2,
          "phone_number": phoneNumber,
          "address": address
        }),
      );
      Map data = response.data["account"];
      print(data);
      Account account = Account(
          firstName: data["first_name"],
          lastname: data["last_name"],
          email: data["email"],
          phone: data["phone_number"],
          address: data["address"]);
      Account.currentAccount = account;
      Get.offAll(const MyPages());
    }catch(e){
      print(e);
      Get.snackbar('Failed', "Account already registered!, sign in instead");
    }
    isBusy.value=false;
  }
}
