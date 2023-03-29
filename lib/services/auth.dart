import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static String get userId {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static User hozirgiFoy() {
    return FirebaseAuth.instance.currentUser!;
  }

  static bool isLogin() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<User?> createUser(
      String email, String pass, BuildContext context) async {
    var auth = FirebaseAuth.instance;

    try {
      var javob = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      return javob.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      return null;
    }
  }

  static Future<User?> signIn(
      String email, String pass, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      return FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (xato) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(xato.message!)));
      return null;
    }
  }
}
