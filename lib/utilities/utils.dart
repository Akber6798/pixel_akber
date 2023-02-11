import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pixel/resourses/app_values.dart';

class Utils {
  showMessage(String message) {
    Fluttertoast.showToast(
      backgroundColor: AppValues.appBlackColor,
      textColor: AppValues.appWhiteColor,
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode currentFocus,
      FocusNode nextFocus) {
        currentFocus.unfocus();
        FocusScope.of(context).requestFocus(nextFocus);
      }
}
