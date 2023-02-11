import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/view_model/bottom_view_model.dart';
import 'package:pixel/views/app_screens.dart/cart_screen.dart';
import 'package:pixel/views/app_screens.dart/category_screen.dart';
import 'package:pixel/views/app_screens.dart/main_screens.dart/home_screen.dart';
import 'package:pixel/views/app_screens.dart/profile_screen.dart';
import 'package:provider/provider.dart';

class BotomNavigationControllerScreen extends StatelessWidget {
  BotomNavigationControllerScreen({super.key});

  List screens = [
    HomeScreen(),
    CategeoryScreen(),
    ProfileScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<BottomController>().bottomIndex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          backgroundColor: AppValues.appBackgrounColor,
          color: AppValues.appMainColor,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (value) {
            context.read<BottomController>().changeIndex(value);
          },
          items: const [
            Icon(Icons.home,
                size: 27, color: AppValues.appBackgrounColor),
            Icon(Icons.category,
                size: 27, color: AppValues.appBackgrounColor),
            Icon(Icons.person,
                size: 27, color: AppValues.appBackgrounColor),
            Icon(Icons.shopping_cart,
                size: 27, color: AppValues.appBackgrounColor),
          ]),
    );
  }
}
