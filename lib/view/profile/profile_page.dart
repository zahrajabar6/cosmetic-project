import 'package:cosmetic_project/controllers/colors.dart';
import 'package:cosmetic_project/controllers/my_button.dart';
import 'package:cosmetic_project/controllers/my_text_field.dart';
import 'package:cosmetic_project/models/account.dart';
import 'package:cosmetic_project/services/auth/auth.dart';
import 'package:cosmetic_project/view/login_Signup_pages/login_page.dart';
import 'package:cosmetic_project/view/login_Signup_pages/signup_page.dart';
import 'package:cosmetic_project/view/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();

}

class _MyProfilePageState extends State<MyProfilePage> {
@override

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:AuthService.hasAccount.value? Column(
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
                    child: Obx((){
                        return MyTextField(
                          icon: Icons.person,
                          hint: '${Account.currentAccount.value!.firstName} ${Account.currentAccount.value!.lastname}',
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Obx((){
                        return MyTextField(
                          icon: Icons.email,
                          hint: Account.currentAccount.value!.email,
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Obx(() {
                        return MyTextField(
                          icon: Icons.phone,
                          hint: Account.currentAccount.value!.phone?? 'Phone Number',
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Obx(() {
                        return MyTextField(
                          icon: Icons.location_on,
                          hint: Account.currentAccount.value!.address ?? 'Address',
                        );
                      }
                    ),
                  ),
                  MyButton(
                      isLoading: false.obs,
                      text: 'Edit Profile',
                      onPress: ()  {
                        Get.to(const EditProfile());
                      }),
                  MyButton(
                      isLoading: false.obs,
                      text: 'Log Out',
                      onPress: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showLogin', false);
                        Get.to(const MyLogin());
                        AuthService.hasAccount.value=false;
                        Account.currentAccount.value= Account(firstName: "firstName", lastname: "lastname", email: "email",token: '',address:'address',phone: 'phone' );
                      })
                ],
              ): Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("You don't Have account?", style: TextStyle(color: grey, fontSize: 24),),
                  ),
                  SizedBox(width:150,
                      child: MyButton(text: 'Register', onPress: (){Get.to(const RegisterPage());}, isLoading: false.obs))
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
