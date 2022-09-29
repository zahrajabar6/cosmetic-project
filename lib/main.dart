import 'package:cosmetic_project/services/auth/localdb.dart';
import 'package:cosmetic_project/view/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DB.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pure Beauty',
            home: child,
            theme: ThemeData(
              primarySwatch: Colors.green,
              fontFamily: 'Lato',
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
          );
        },
        child:const LoadingScreen());
  }
}
