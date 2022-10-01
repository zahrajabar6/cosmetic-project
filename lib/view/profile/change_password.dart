import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/text_form_field.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();
  String oldPass='';
  String newPass='';
  String confirmPass='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: grey,
            )),
        title: Text('Change Password',
            style: TextStyle(
                color: grey, fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                 MyTextFormField(
                   obsecure: true,
                   label: 'Old password',
                   onChanged: (x){
                     oldPass=x;
                   },
                   validator: (x) {
                     if (x!.length<8) {
                       return "Passwords don't match";
                     } else {
                       return null;
                     }
                   },),
                MyTextFormField(
                  obsecure: true,
                  label: 'New password',
                  onChanged: (x){
                    newPass=x;
                  },
                  validator: (x) {
                    if (x!.length<8) {
                      return "Passwords don't match";
                    } else {
                      return null;
                    }
                  },),
                MyTextFormField(
                  obsecure: true,
                  label: 'Confirm password',
                  onChanged: (x){
                    confirmPass=x;
                  },
                  validator: (x) {
                    if (x!.length<8) {
                      return "Passwords don't match";
                    } else {
                      return null;
                    }
                  },),
                MyButton(
                    isLoading: AuthService.isChange ,
                    text: r'Save Changes',
                    onPress: ()  {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        AuthService.changePassword(oldPass: oldPass, newPass: newPass, confirmPass: confirmPass);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
