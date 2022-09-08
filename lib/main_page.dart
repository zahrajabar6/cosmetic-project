import 'package:cosmetic_project/Cart/cart_page.dart';
import 'package:cosmetic_project/Favorite/favorite_page.dart';
import 'package:cosmetic_project/Home/home_page.dart';
import 'package:cosmetic_project/Profile/profile_page.dart';
import 'package:cosmetic_project/Search/search_page.dart';
import 'package:cosmetic_project/colors.dart';
import 'package:cosmetic_project/my_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  int index = 0;
  final screens = [
    const MyHomePage(),
    const MyFavoritePage(),
    const MySearchPage(),
    const MyCartPage(),
    const MyProfilePage()
  ];
  @override
  final items = <Widget>[
    const MyIcons(icon: Icons.home),
    const MyIcons(icon: Icons.favorite),
    const MyIcons(icon: Icons.search),
    const MyIcons(icon: Icons.shopping_cart),
    const MyIcons(icon: Icons.person)
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
          color: light_green,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          height: 60,
          index: index,
          items: items,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          }),
    );
  }
}
