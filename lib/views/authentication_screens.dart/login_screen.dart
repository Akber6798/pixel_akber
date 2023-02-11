import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/resourses/refactor_widgets/button.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/utilities/utils.dart';
import 'package:pixel/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);
  FocusNode emailFocusNote = FocusNode();
  FocusNode passwordFocusNote = FocusNode();

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
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
          SizedBox(
            height: he,
            width: we,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: he * .1),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login to account',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Continue by login to your account',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppValues.smallTextColor)),
                        ),
                      ),
                      SizedBox(height: he * .068),
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
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: ((value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNote, passwordFocusNote);
                        }),
                        focusNode: emailFocusNote,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Please enter your valid email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'abcd@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: const OutlineInputBorder()),
                      ),
                      SizedBox(height: he * .020),
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
                              focusNode: passwordFocusNote,
                              obscureText: value,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^((?=\S*?[A-Z])(?=\S*?[a-z])(?=.*[!@#$%^&*])(?=\S*?[0-9]).{6,})\S$')
                                        .hasMatch(value)) {
                                  return 'Please Enter correct Password';
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.forgot);
                            },
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(color: AppValues.appMainColor),
                            )),
                      ),
                      SizedBox(height: he * .07),
                      Button(
                          loading:
                              context.watch<AuthenticationService>().isLoading,
                          title: 'Login',
                          pressed: () {
                            isChecking(context);
                          }),
                      SizedBox(height: he * .045),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                              height: 50,
                              width: 50,
                              image:
                                  AssetImage('assets/images/google_logo.png')),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AuthenticationService>()
                                  .signUpWithGoogle(context);
                            },
                            child: Text(
                              'Login with Google',
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppValues.smallTextColor)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: he * .08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RouteName.sign);
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppValues.appMainColor)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  isChecking(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationService>().login(
          emailController.text.toString(),
          passwordController.text.toString(),
          context);
    }
  }
}
