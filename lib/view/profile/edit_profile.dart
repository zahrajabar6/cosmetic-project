import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/text_form_field.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:cosmetic_project/view/profile/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  String firstName='';
  String lastName='';
  String phoneNumber='';
  String address='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Text('Edit Profile',
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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
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
                        label:'Phone Number',
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
                    MyButton(
                        isLoading: false.obs,
                       text: r'Change Password',
                        onPress: ()  {
                          FocusScope.of(context).unfocus();
                          Get.to(const ChangePassword());
                        }),
                    MyButton(
                        isLoading: AuthService.isUpdate ,
                        text: 'Save',
                        onPress: ()  async{
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            AuthService.updateProfile(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, address: address);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
