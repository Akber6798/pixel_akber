import 'package:flutter/material.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/views/app_screens.dart/cart_screen.dart';
import 'package:pixel/views/app_screens.dart/category_screen.dart';
import 'package:pixel/views/app_screens.dart/main_screens.dart/home_screen.dart';
import 'package:pixel/views/app_screens.dart/profile_screen.dart';
import 'package:pixel/views/authentication_screens.dart/forgot_password_screen.dart';
import 'package:pixel/views/authentication_screens.dart/get_started_screen.dart';
import 'package:pixel/views/authentication_screens.dart/login_screen.dart';
import 'package:pixel/views/authentication_screens.dart/sign_up_screen.dart';
import 'package:pixel/views/authentication_screens.dart/splash_screen.dart';
import 'package:pixel/views/bottom_navigation_controller.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (contex) => SplashScreen());
      case RouteName.getStart:
        return MaterialPageRoute(builder: (contex) => GetStartedScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (contex) => LoginScreen());
      case RouteName.sign:
        return MaterialPageRoute(builder: (contex) => SignUpScreen());
      case RouteName.controller:
        return MaterialPageRoute(
            builder: (contex) => BotomNavigationControllerScreen());
      case RouteName.forgot:
        return MaterialPageRoute(builder: (contex) => ForgotPasswordScreen());
      case RouteName.cart:
        return MaterialPageRoute(builder: (contex) => CartScreen());
      case RouteName.category:
        return MaterialPageRoute(builder: (contex) => CategeoryScreen());
      // case RouteName.detail:
      //   return MaterialPageRoute(builder: (contex) => DetailScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (contex) => HomeScreen());
      case RouteName.profile:
        return MaterialPageRoute(builder: (contex) => ProfileScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          final he = MediaQuery.of(context).size.height;
          final we = MediaQuery.of(context).size.width;
          return Scaffold(
              body: Container(
            height: he,
            width: we,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/error.png')),
                Text(
                  'OOPSS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ));
        });
    }
  }
}
