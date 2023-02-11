// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/utilities/utils.dart';

class AuthenticationService with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  signUp(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      setLoading(false);
      Navigator.pushReplacementNamed(context, RouteName.controller);
      Utils().showMessage('SignUp Successfully');
    } on FirebaseAuthException catch (error) {
      setLoading(false);
      Utils().showMessage(error.message.toString());
    }
  }

  login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      Navigator.pushReplacementNamed(context, RouteName.controller);
      Utils().showMessage('Login SuccessFully');
    } on FirebaseAuthException catch (error) {
      setLoading(false);
      Utils().showMessage(error.message.toString());
    }
  }

  signUpWithGoogle(BuildContext context) async {
    try {
      //signup to google
      GoogleSignInAccount? googleSignAccount = await googleSignIn.signIn();
      if (googleSignAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        //then sign to firebase
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          Navigator.pushReplacementNamed(context, RouteName.controller);
          Utils().showMessage('Login SuccessFully');
        } catch (e) {
          Utils().showMessage(e.toString());
        }
      } else {
        Utils().showMessage('Unable to Login');
      }
    } on FirebaseAuthException catch (error) {
      Utils().showMessage(error.message.toString());
    }
  }

  logOut(BuildContext context) {
    try {
      auth.signOut();
      googleSignIn.signOut();
      Utils().showMessage('Log out succesfully');
      Navigator.pushReplacementNamed(context, RouteName.getStart);
    } on FirebaseAuthException catch (error) {
      Utils().showMessage(error.message.toString());
    }
  }

  forgottPassword(BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Utils().showMessage(
          'We have send you an email for recover the password, \n please check the email');
    } on FirebaseAuthException catch (error) {
      Utils().showMessage(error.message.toString());
    }
  }
}
