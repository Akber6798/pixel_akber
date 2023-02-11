import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/utilities/routes/routes_name.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, RouteName.controller);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Image(
                height: 40,
                image: AssetImage('assets/images/logo_text_blue.png')),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Center(
                  child: Image(
                      height: he * .5,
                      image: const AssetImage('assets/images/emptycart.png')),
                ),
                Text(
                  'Your Cart is Empty!!!',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: he * .02),
                Text(
                  "Add items to the cart to view\n it here.",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppValues.smallTextColor)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
