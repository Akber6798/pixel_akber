import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, RouteName.controller);
        return Future.value(false);
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(height: he * .05),
            Container(
              height: he * .35,
              width: we,
              decoration: BoxDecoration(
                  border: Border.all(width: .2),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[100]),
              child: Column(
                children: [
                  SizedBox(height: he * .02),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 18),
                        child: Icon(
                          Icons.settings_sharp,
                          size: 35,
                        ),
                      )),
                  SizedBox(height: he * .01),
                  CircleAvatar(
                    backgroundColor: AppValues.appBackgrounColor,
                    backgroundImage: checkingimage(),
                    radius: 50,
                  ),
                  SizedBox(height: he * .01),
                  Text(
                    checkinName(),
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppValues.appBlackColor
                    )),
                  ),
                  SizedBox(height: he * .01),
                  Text(
                    auth.currentUser!.email.toString(),
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  SizedBox(height: he * .02),
                ],
              ),
            ),
            SizedBox(height: he * .03),
            Row(
              children: [
                const Icon(
                  Icons.update,
                  size: 30,
                ),
                SizedBox(width: we * .020),
                Text(
                  'My Orders',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(width: we * .45),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                )
              ],
            ),
            SizedBox(height: he * .015),
            Row(
              children: [
                const Icon(
                  Icons.local_shipping,
                  size: 30,
                ),
                SizedBox(width: we * .020),
                Text(
                  'Track Orders',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(width: we * .39),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                )
              ],
            ),
            SizedBox(height: he * .015),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 30,
                ),
                SizedBox(width: we * .020),
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(width: we * .49),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: he * .015),
            Row(
              children: [
                const Icon(
                  Icons.phone_in_talk,
                  size: 30,
                ),
                SizedBox(width: we * .020),
                Text(
                  'Contact us',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(width: we * .43),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: he * .015),
            Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 30,
                ),
                SizedBox(width: we * .020),
                Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(width: we * .49),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: he * .1),
            InkWell(
              onTap: () {
                context.read<AuthenticationService>().logOut(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  SizedBox(width: we * .020),
                  Text(
                    'LogOut',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  checkingimage() {
    if (auth.currentUser!.photoURL == null) {
      return const AssetImage('assets/images/profilepic.png');
    } else {
      return NetworkImage(auth.currentUser!.photoURL.toString());
    }
  }

  checkinName() {
    if (auth.currentUser!.displayName == null) {
      return 'No name';
    }else{
      return auth.currentUser!.displayName.toString();
    }
  }
}
