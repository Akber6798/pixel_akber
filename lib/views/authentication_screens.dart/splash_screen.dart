import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/utilities/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    isLoggedInOrNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppValues.appMainColor,
      body: Center(
        child: Image(image: AssetImage('assets/images/logo_text_white.png')),
      ),
    );
  }
  

  //checking user is login or not
  isLoggedInOrNot() {
    if (auth.currentUser == null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.getStart);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.controller);
      });
    }
  }
}
