import 'dart:convert';
import 'package:cosmetic_project/models/account.dart';
import 'package:cosmetic_project/services/auth/localdb.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response ;

class AuthService {

  static RxBool isLogin = false.obs;
  static RxBool isSignUp = false.obs;
  static RxBool isUpdate = false.obs;
  static RxBool isChange = false.obs;
  static RxBool hasAccount = false.obs;

  static signIn({required String email, required String password}) async {
    isLogin.value=true;
    try{
      Response response = await Dio()
          .post('https://fatimasalah.pythonanywhere.com/api/auth/signin',
        data:
      jsonEncode({
        "email": email ,
        "password": password ,
      }),
      );
      Map data = response.data["account"];
      String token = response.data["token"]["access"];
      Account? account = Account(firstName: data["first_name"],
          lastname: data["last_name"],
          email: data["email"],
          phone: data["phone_number"],
          address: data["address"],
          token: token
      );
      Account.currentAccount.value = account;
      hasAccount.value=true;
      //to keep the user signed in
      DB.prefs.setString('email', email);
      DB.prefs.setString('password', password);
      //go to home
      Get.offAll(const MyPages());
    }catch(e){
      Get.snackbar('Failed', "Incorrect email or password");
      Get.to(MyLogin());
    }
    isLogin.value=false;
  }

  static signUp({required String firstName,required String lastName,required String phoneNumber,required String address,required String email, required String password1,required String password2}) async {
    isSignUp.value=true;
    try{
      Response response = await Dio()
          .post('https://fatimasalah.pythonanywhere.com/api/auth/signup',
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
      String token = response.data['token']["access"];
      Account? account = Account(
          token: token,
          firstName: data["first_name"],
          lastname: data["last_name"],
          email: data["email"],
          phone: data["phone_number"],
          address: data["address"]);
      Account.currentAccount.value = account;
      hasAccount.value=true;
      //to keep the user signed in
      DB.prefs.setString('email', email);
      DB.prefs.setString('password', password1);
      Get.offAll(const MyPages());
    }catch(e){
      Get.snackbar('Failed', "Account already registered!, sign in instead");
    }
    isSignUp.value=false;
  }

  static updateProfile({required String firstName,required String lastName,required String phoneNumber,required String address}) async {
    isUpdate.value=true;
    Dio dio = Dio();
    dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
    try{
      Response response = await dio
          .put('https://fatimasalah.pythonanywhere.com/api/auth/update',
        data:jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "phone_number": phoneNumber,
          "address": address
        }),
      );
      Map data = response.data;
      Account account = Account(
          token: Account.currentAccount.value!.token,
          firstName: data["first_name"],
          lastname: data["last_name"],
          email: data["email"],
          phone: data["phone_number"],
          address: data["address"]);
      Account.currentAccount.value=account;
      hasAccount.value=true;
      Get.snackbar('Done', 'Profile Updated Successfully');
    }catch(e){
      Get.snackbar('Failed', "Failed to update");
    }
    isUpdate.value=false;
  }

  static changePassword({required String oldPass,required String newPass,required String confirmPass}) async {
    isChange.value=true;
    Dio dio = Dio();
    dio.options.headers["authorization"] = "Bearer ${Account.currentAccount.value!.token}";
    try{
      Response response = await dio
          .post('https://fatimasalah.pythonanywhere.com/api/auth/change-password',
        data:jsonEncode({
          "old_password": oldPass,
          "new_password1": newPass,
          "new_password2": confirmPass
        }),
      );
      Get.snackbar('Done', response.data['detail']);
    }catch(e){
      Get.snackbar('Failed', "Failed to change password");
    }
    isChange.value=false;
  }
}
