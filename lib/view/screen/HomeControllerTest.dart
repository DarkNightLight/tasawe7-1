// ignore_for_file: file_names

import 'package:Tasawe7/view/screen/suggestions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestLoginControllerInp extends GetxController {
  final formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await userCredential.user!.sendEmailVerification();
      Get.snackbar("Success", "Verification email sent");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!);
    }
  }

  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (!userCredential.user!.emailVerified) {
        Get.snackbar("Error", "Please verify your email");
      } else {
        Get.off(() => Suggestions());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!);
    }
  }

}


