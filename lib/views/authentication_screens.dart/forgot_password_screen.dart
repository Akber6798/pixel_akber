import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/resourses/refactor_widgets/button.dart';
import 'package:pixel/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        const Positioned(
            bottom: 0,
            left: 0,
            child: Image(
                image:
                    AssetImage('assets/images/bottom_left_round_element.png'))),
        SizedBox(
          height: he,
          width: we,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(height: he * .1),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Your Email',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppValues.smallTextColor)),
                  ),
                ),
                SizedBox(height: he * .01),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: 'abcd@gmail.com', border: OutlineInputBorder()),
                ),
                SizedBox(height: he * .05),
                Button(
                    title: 'Reset',
                    pressed: () {
                      context.read<AuthenticationService>().forgottPassword(
                          context, emailController.text.toString());
                    })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
