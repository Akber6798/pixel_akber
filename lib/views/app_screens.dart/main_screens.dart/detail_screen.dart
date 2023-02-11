import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {super.key,
      required this.id,
      required this.brand,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.rating,
      required this.imagesList});

  String title;
  String brand;
  String description;
  String image;
  int price;
  double rating;
  int id;
  late List<dynamic> imagesList;

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back_ios_new,
                color: AppValues.smallTextColor, size: 25)),
        actions: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(width: we * .030),
        ],
      ),
      persistentFooterButtons: [
        SizedBox(
          height: he * .055,
          width: we,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: he * 0.09,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF403B58),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: AppValues.appBackgrounColor),
                      )),
                )
              ],
            ),
          ),
        )
      ],
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            SizedBox(height: he * .01),
            Hero(
                tag: id,
                child: Image(
                    height: he * .22, width: we, image: NetworkImage(image))),
            SizedBox(height: he * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: we*.74,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),
                Container(
                  height: he * .05,
                  width: we * .2,
                  decoration: BoxDecoration(
                      border: Border.all(width: .2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        rating.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  brand,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppValues.smallTextColor)),
                )),
            SizedBox(height: he * .02),
            Text(
              description,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppValues.smallTextColor)),
            ),
            SizedBox(height: he * .03),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
              ),
              items: imagesList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                        color: AppValues.appBackgrounColor,
                        child: Image(image: NetworkImage(i)));
                  },
                );
              }).toList(),
            )
          ])),
    );
  }
}
