import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';

class Button extends StatelessWidget {
  final String title;
  VoidCallback pressed;
  final bool loading;
  Button(
      {super.key,
      required this.title,
      required this.pressed,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return SizedBox(
      width: we,
      height: he * .060,
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppValues.appMainColor),
          onPressed: pressed,
          child: loading
              ? const CircularProgressIndicator(
                  color: AppValues.appBackgrounColor,
                )
              : Text(
                  title,
                  style:
                      GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18)),
                )),
    );
  }
}
