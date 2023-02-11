import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/refactor_widgets/button.dart';
import 'package:pixel/utilities/routes/routes_name.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
                bottom: 0,
                left: 0,
                child: Image(
                    image: AssetImage(
                        'assets/images/bottom_left_round_element.png'))),
            Container(
              height: he,
              width: we,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: he * .1,
                    ),
                    const Image(
                        height: 260,
                        width: 260,
                        image: AssetImage('assets/images/round_image.png')),
                    SizedBox(
                      height: he * .08,
                    ),
                    const Image(
                        height: 70,
                        width: 160,
                        image: AssetImage('assets/images/logo_text_blue.png')),
                         SizedBox(
                      height: he * .04,
                    ),
                    Text(
                      "Let's choose your awesome products \n from our wide range of collections",
                      style: GoogleFonts.poppins(
                          textStyle:
                              const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                     SizedBox(
                      height: he * .05,
                    ),
                    Button(
                      pressed: () {
                        Navigator.pushNamed(context, RouteName.login);
                      },
                      title: 'Get Started',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
