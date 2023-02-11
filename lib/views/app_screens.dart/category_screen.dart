import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/resourses/refactor_widgets/api_reuse_class.dart';
import 'package:pixel/utilities/routes/routes_name.dart';

class CategeoryScreen extends StatelessWidget {
  CategeoryScreen({super.key});

  List<String> categeories = [
    'laptops',
    'smartphones',
    'fragrances',
    'skincare',
    'groceries',
    'home-decoration'
  ];

  List<String> images = [
    'assets/images/laptop.png',
    'assets/images/mobile.png',
    'assets/images/fragrance.png',
    'assets/images/skincare.png',
    'assets/images/groceries.png',
    'assets/images/home-decor.png'
  ];

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
                SizedBox(height: he * .03),
                Text(
                  'Categeories',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppValues.smallTextColor)),
                ),
                SizedBox(height: he * .03),
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ApiReuseClass(
                                          item: categeories[index],
                                        ))));
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(images[index]),
                              ),
                              SizedBox(
                                height: he * .01,
                              ),
                              Text(
                                categeories[index],
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppValues.smallTextColor)),
                              ),
                            ],
                          ));
                    }),
                    itemCount: categeories.length)
              ],
            ),
          )),
    );
  }
}
