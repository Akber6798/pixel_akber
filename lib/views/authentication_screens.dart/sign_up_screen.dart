import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/utilities/utils.dart';
import 'package:pixel/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../resourses/refactor_widgets/button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);
  ValueNotifier<bool> obsecureConfirmPassword = ValueNotifier(true);
  FocusNode emailFocusNote = FocusNode();
  FocusNode passwordFocusNote = FocusNode();
  FocusNode passwordConfirmFocusNote = FocusNode();

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              bottom: 0,
              left: 0,
              child: Image(
                  image: AssetImage(
                      'assets/images/bottom_left_round_element.png'))),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: he * .2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create account',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Start exploring each products!',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppValues.smallTextColor)),
                        ),
                      ),
                      SizedBox(height: he * .030),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your Email',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppValues.smallTextColor)),
                        ),
                      ),
                      SizedBox(height: he * .005),
                      TextFormField(
                        onFieldSubmitted: ((value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNote, passwordFocusNote);
                        }),
                        focusNode: emailFocusNote,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'abcd@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: he * .030),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your Password',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppValues.smallTextColor)),
                        ),
                      ),
                      SizedBox(height: he * .005),
                      ValueListenableBuilder(
                          valueListenable: obsecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              onFieldSubmitted: ((value) {
                                Utils.fieldFocusChange(
                                    context,
                                    passwordFocusNote,
                                    passwordConfirmFocusNote);
                              }),
                              focusNode: passwordFocusNote,
                              obscureText: value,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^((?=\S*?[A-Z])(?=\S*?[a-z])(?=.*[!@#$%^&*])(?=\S*?[0-9]).{6,})\S$')
                                        .hasMatch(value)) {
                                  return 'Please Enter Password';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: 'Abcde@123',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  suffixIcon: obsecurePassword.value
                                      ? IconButton(
                                          onPressed: () {
                                            obsecurePassword.value =
                                                !obsecurePassword.value;
                                          },
                                          icon: const Icon(
                                              Icons.visibility_off_outlined))
                                      : IconButton(
                                          onPressed: () {
                                            obsecurePassword.value =
                                                !obsecurePassword.value;
                                          },
                                          icon: const Icon(
                                              Icons.visibility_outlined)),
                                  border: const OutlineInputBorder()),
                            );
                          }),
                      SizedBox(height: he * .030),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm Password',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppValues.smallTextColor)),
                        ),
                      ),
                      SizedBox(height: he * .005),
                      ValueListenableBuilder(
                          valueListenable: obsecureConfirmPassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              focusNode: passwordConfirmFocusNote,
                              obscureText: value,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^((?=\S*?[A-Z])(?=\S*?[a-z])(?=.*[!@#$%^&*])(?=\S*?[0-9]).{6,})\S$')
                                        .hasMatch(value)) {
                                  return 'Please re enter your Password';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'Abcde@123',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  suffixIcon: obsecureConfirmPassword.value
                                      ? IconButton(
                                          onPressed: () {
                                            obsecureConfirmPassword.value =
                                                !obsecureConfirmPassword.value;
                                          },
                                          icon: const Icon(
                                              Icons.visibility_off_outlined))
                                      : IconButton(
                                          onPressed: () {
                                            obsecureConfirmPassword.value =
                                                !obsecureConfirmPassword.value;
                                          },
                                          icon: const Icon(
                                              Icons.visibility_outlined)),
                                  border: const OutlineInputBorder()),
                            );
                          }),
                      SizedBox(height: he * .020),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "by signing up you are agree to pixel's Terms of use\nand Privacy policy",
                          style: TextStyle(
                              fontSize: 13, color: AppValues.smallTextColor),
                        ),
                      ),
                      SizedBox(height: he * .050),
                      Button(
                          loading:
                              context.watch<AuthenticationService>().isLoading,
                          title: 'SignUp',
                          pressed: () {
                            isChecking(context);
                          }),
                      SizedBox(height: he * .050),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RouteName.login);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppValues.appMainColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  isChecking(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationService>().signUp(
          emailController.text.toString(),
          passwordController.text.toString(),
          context);
    }
  }
}
